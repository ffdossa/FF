//
//  StartingViewModel.swift
//  FF
//
//  Created by Andrii Marchuk on 23.02.2025.
//

import Foundation
import Firebase
import FirebaseAuth
import Combine

final class AuthViewModel: ObservableObject {
    @Published var login: String = ""
    @Published var password: String = ""
    @Published var isAuthFormValidate: Bool = false
    @Published var user: User?
    @Published var error: String?

    private var subscriptions: Set<AnyCancellable> = []

    init() {
        setupValidation()
    }

    private func setupValidation() {
        Publishers.CombineLatest($login, $password)
//            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .map { [weak self] email, password in
                guard let self = self else { return false }
                return self.isValidateEmail(email) && password.count >= 8
            }
            .sink(receiveValue: { [weak self] isValid in
                self?.isAuthFormValidate = isValid
            })
            .store(in: &subscriptions)
    }

    private func isValidateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    func createUser() {
        AuthManager.shared.createUser(email: login, password: password)
//            .handleEvents(receiveOutput: { [weak self] user in
//                self?.user = user
//            })
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            }, receiveValue: { [weak self] user in
                self?.user = user
                self?.createRecord(for: user)
            })
            .store(in: &subscriptions)
    }

    func signIn() {
        AuthManager.shared.signIn(email: login, password: password)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            }, receiveValue: { [weak self] user in
                self?.user = user
            })
            .store(in: &subscriptions)
    }

    func signOut() {
        AuthManager.shared.signOut()
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            }, receiveValue: { [weak self] _ in
                self?.user = nil
            })
            .store(in: &subscriptions)
    }

    func createRecord(for user: User) {
        DatabaseManager.shared.addUser(user)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            }, receiveValue: { state in
                print("ADD USER RECORD IN DATABASE \(state)")
            })
            .store(in: &subscriptions)
    }

//    func createUserWithPhoto(imageData: Data) {
//        guard !imageData.isEmpty, isAuthFormValidate else {
//            self.error = "Invalid image or form data"
//            return
//        }
//
//        let fileID = UUID().uuidString
//        StorageManager.shared.uploadProfilePhoto(imageData: imageData, fileID: fileID)
//            .flatMap { url -> AnyPublisher<User, Error> in
//                AuthManager.shared.createUser(email: self.email, password: self.password)
//            }
//            .flatMap { user -> AnyPublisher<Bool, Error> in
//                var userModel = UserModel(from: user)
//                userModel.avatarURL = "images/\(fileID).jpg"
//                return DatabaseManager.shared.addUser(user)
//            }
//            .sink(receiveCompletion: { [weak self] completion in
//                if case .failure(let error) = completion {
//                    self?.error = error.localizedDescription
//                }
//            }, receiveValue: { [weak self] _ in
//                self?.user = Auth.auth().currentUser
//            })
//            .store(in: &subscriptions)
//    }
}
