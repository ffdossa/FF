//
//  SearchViewController.swift
//  FF
//
//  Created by Andrii Marchuk on 26.02.2025.
//

import UIKit
import SwiftUI

class SearchViewController: UIViewController {

    var searchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()

        searchView.setupHostingController(self)
    }
}

// MARK: View

struct SearchView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SearchView()
}
