//
//  File.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import UIKit

class LogInViewController: UIViewController {

    var loginView = LogInView()

    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.setupHostingController(self)
    }
}
