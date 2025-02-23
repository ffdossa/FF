//
//  UserModel.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import Foundation
import Firebase
import FirebaseAuth

struct UserModel: Codable {
    let id: String
    var avatarURL: String = ""
    var fullName: String = ""
    var userName: String = ""
    var biography: String = ""
    var location: String = ""
    var website: String = ""
    var dateOfBirth: Date = Date()
    var registrationDate: Date = Date()
    var following: Int = 0
    var followers: Int = 0
    var isOnboardingComplete: Bool = false

    init(from user: User) {
        self.id = user.uid
    }
}

