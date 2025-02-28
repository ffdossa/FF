//
//  NotificationViewController.swift
//  FF
//
//  Created by Andrii Marchuk on 26.02.2025.
//

import UIKit
import SwiftUI

class NotificationViewController: UIViewController {

    var notificationView = NotificationView()

    override func viewDidLoad() {
        super.viewDidLoad()

        notificationView.setupHostingController(self)
    }
}

// MARK: View

struct NotificationView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NotificationView()
}
