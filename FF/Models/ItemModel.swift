//
//  ItemModel.swift
//  FF
//
//  Created by Andrii Marchuk on 27.02.2025.
//

import Foundation

struct ItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let createDate: TimeInterval
    var isDone: Bool

    mutating func toggleDone(_ state: Bool) {
        isDone = state
    }
}
