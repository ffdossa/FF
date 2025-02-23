//
//  File.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import UIKit

class SignUpViewController: UIViewController {

    var signupView = SignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()

        signupView.setupHostingController(self)
    }
}
