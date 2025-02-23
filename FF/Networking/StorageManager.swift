//
//  StorageManager.swift
//  FF
//
//  Created by Andrii Marchuk on 23.02.2025.
//

import Foundation
import Combine
import FirebaseStorageCombineSwift
import FirebaseStorage

enum StorageError: Error {
    case invalidImageID
    case uploadFailed(String)
    case invalidImageFormat
}

final class StorageManager {
    static let shared = StorageManager()

    private let storage = Storage.storage()
    private let imagesPath = "images"

    private init() {}

    func getDownloadURL(forPath path: String?) -> AnyPublisher<URL, Error> {
        guard let path = path, !path.isEmpty else {
            return Fail(error: StorageError.invalidImageID)
                .eraseToAnyPublisher()
        }
        return storage
            .reference(withPath: path)
            .downloadURL()
            .mapError { error in StorageError.uploadFailed(error.localizedDescription) }
            .eraseToAnyPublisher()
    }

    func uploadProfilePhoto(imageData: Data, fileID: String, metadata: StorageMetadata? = nil) -> AnyPublisher<URL, Error> {
        guard !fileID.isEmpty else {
            return Fail(error: StorageError.invalidImageID)
                .eraseToAnyPublisher()
        }
        let ref = storage.reference().child("\(imagesPath)/\(fileID).jpg")
        let uploadMetadata = metadata ?? StorageMetadata()
        uploadMetadata.contentType = "image/jpeg"

        return ref.putData(imageData, metadata: uploadMetadata)
            .flatMap { _ in ref.downloadURL() }
            .mapError { error in StorageError.uploadFailed(error.localizedDescription) }
            .eraseToAnyPublisher()
    }
}
