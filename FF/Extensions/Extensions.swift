//
//  Extensions.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import UIKit
import SwiftUI

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }

        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

extension Color {
    init(hexString: String) {
        guard hexString.hasPrefix("#") else {
            self = .clear
            return
        }

        let hex = hexString.trimmingCharacters(in: .init(["#"]))

        var value = UInt32()
        Scanner(string: hex).scanHexInt32(&value)

        if hexString.count == 7 {
            value = value << 8
            value += 0xFF
            self.init(hex: value)
        } else if hexString.count == 9 {
            self.init(hex: value)
        } else {
            self = .clear
        }
    }

    init(hex: UInt32) {
        let r, g, b, a: Double

        r = Double((hex >> 24) & 0xFF) / 255.0
        g = Double((hex >> 16) & 0xFF) / 255.0
        b = Double((hex >> 8)  & 0xFF) / 255.0
        a = Double( hex        & 0xFF) / 255.0

        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}

extension View {
    func setupHostingController(_ parent: UIViewController) {
        let hostingController = UIHostingController(rootView: self)
        parent.addChild(hostingController)
        parent.view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: parent.view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: parent.view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: parent.view.trailingAnchor)
        ])
        hostingController.didMove(toParent: parent)
    }
}

