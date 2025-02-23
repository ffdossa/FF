//
//  File.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import UIKit

class StartingViewController: UIViewController {

    var startingView = StartingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startingView.setupHostingController(self)
    }
}

