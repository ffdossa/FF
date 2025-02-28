//
//  SettingsViewController.swift
//  FF
//
//  Created by Andrii Marchuk on 26.02.2025.
//

import UIKit
import SwiftUI

class SettingsViewController: UIViewController {

    var settingsView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsView.setupHostingController(self)
    }
}

// MARK: View

struct SettingsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SettingsView()
}
