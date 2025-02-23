//
//  DatabaseManager.swift
//  FF
//
//  Created by Andrii Marchuk on 23.02.2025.
//

@preconcurrency import Firebase
import Combine
import FirebaseAuth
import FirebaseFirestoreCombineSwift

enum FirestoreError: Error {
    case documentNotFound
}

struct DatabaseManager : Sendable {
    static let shared = DatabaseManager()

    let db = Firestore.firestore()
    let usersPath: String = "users"
    let contentPath: String = "content"
    let followsPath: String = "follows"

    // Add User
    func addUser(_ user: User) -> AnyPublisher<Bool, Error> {
        let userModel = UserModel(from: user)
        return db.collection(usersPath).document(userModel.id).setData(from: userModel)
            .map { true }
            .eraseToAnyPublisher()
    }

    // Retrieve User
    func fetchUser(id: String) -> AnyPublisher<UserModel, Error> {
        db.collection(usersPath).document(id).getDocument()
            .tryMap { snapshot in
                guard snapshot.exists else { throw FirestoreError.documentNotFound }
                return try snapshot.data(as: UserModel.self)
            }
            .eraseToAnyPublisher()
    }

    // Update User Fields
    func updateUser(id: String, fields: [String: Any]) -> AnyPublisher<Bool, Error> {
        db.collection(usersPath).document(id).updateData(fields)
            .map { true }
            .eraseToAnyPublisher()
    }

    // Add Tweet
    func addContent(_ content: ContentModel) -> AnyPublisher<Bool, Error> {
        db.collection(contentPath).document(content.id).setData(from: content)
            .map { true }
            .eraseToAnyPublisher()
    }

    // Search Users by Username
    func searchUsers(query: String) -> AnyPublisher<[UserModel], Error> {
        db.collection(usersPath).whereField("userName", isEqualTo: query)
            .getDocuments()
            .tryMap { try $0.documents.map { try $0.data(as: UserModel.self) } }
            .eraseToAnyPublisher()
    }

    // Fetch Tweets by Author
    func fetchTweets(forAuthorID authorID: String) -> AnyPublisher<[ContentModel], Error> {
        db.collection(contentPath).whereField("authorID", isEqualTo: authorID)
            .getDocuments()
            .tryMap { try $0.documents.map { try $0.data(as: ContentModel.self) } }
            .eraseToAnyPublisher()
    }

    // Check Follow Status
    func isFollowing(followerID: String, followingID: String) -> AnyPublisher<Bool, Error> {
        db.collection(followsPath)
            .whereField("follower", isEqualTo: followerID)
            .whereField("following", isEqualTo: followingID)
            .getDocuments()
            .map { !$0.documents.isEmpty }
            .eraseToAnyPublisher()
    }


    // Follow User
        func follow(followerID: String, followingID: String) -> AnyPublisher<Bool, Error> {
            db.collection(followsPath).document().setData([
                "follower": followerID,
                "following": followingID,
                "timestamp": FieldValue.serverTimestamp()
            ])
            .map { true }
            .eraseToAnyPublisher()
        }

    // Unfollow User
    func unfollow(followerID: String, followingID: String) -> AnyPublisher<Bool, Error> {
        db.collection(followsPath)
            .whereField("follower", isEqualTo: followerID)
            .whereField("following", isEqualTo: followingID)
            .getDocuments()
            .flatMap { snapshot in
                guard let doc = snapshot.documents.first else {
                    return Just(true).setFailureType(to: Error.self).eraseToAnyPublisher()
                }
                return doc.reference.delete().map { true }.eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }

//    func loadProfileImageURL(for user: UserModel) -> AnyPublisher<URL, Error> {
//        StorageManager.shared.getDownloadURL(forPath: user.avatarURL)
//    }
}

