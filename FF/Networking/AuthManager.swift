//
//  AuthManager.swift
//  FF
//
//  Created by Andrii Marchuk on 23.02.2025.
//

import FirebaseAuth
import Combine
import FirebaseAuthCombineSwift

final class AuthManager {
    static let shared = AuthManager()

    private init() {}

    func createUser(email: String, password: String) -> AnyPublisher<User, Error> {
        Auth.auth().createUser(withEmail: email, password: password)
            .map(\.user)
            .mapError { error in
                AuthError(from: error)
            }
            .eraseToAnyPublisher()
    }

    func signIn(email: String, password: String) -> AnyPublisher<User, Error> {
        Auth.auth().signIn(withEmail: email, password: password)
            .map(\.user)
            .mapError { error in
                AuthError(from: error)
            }
            .eraseToAnyPublisher()
    }

    func signOut() -> AnyPublisher<Void, Error> {
        Future { promise in
            do {
                try Auth.auth().signOut()
                promise(.success(()))
            } catch {
                promise(.failure(AuthError(from: error)))
            }
        }
        .eraseToAnyPublisher()
    }

    var currentUser: User? {
        Auth.auth().currentUser
    }

    func userState() -> AnyPublisher<User?, Never> {
        Auth.auth().authStateDidChangePublisher()
            .map { $0 }
            .eraseToAnyPublisher()
    }
}

// Custom error type for better handling
enum AuthError: Error {
    case invalidCredentials
    case weakPassword
    case userNotFound
    case unknown(Error)

    init(from error: Error) {
        let nsError = error as NSError
        switch nsError.code {
        case AuthErrorCode.invalidEmail.rawValue, AuthErrorCode.invalidCredential.rawValue:
            self = .invalidCredentials
        case AuthErrorCode.weakPassword.rawValue:
            self = .weakPassword
        case AuthErrorCode.userNotFound.rawValue:
            self = .userNotFound
        default:
            self = .unknown(error)
        }
    }

    var localizedDescription: String {
        switch self {
        case .invalidCredentials:
            return "Invalid email or password."
        case .weakPassword:
            return "Password is too weak."
        case .userNotFound:
            return "User not found."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
