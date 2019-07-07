//
//  WSScrollViewController.swift
//  WSPopupExample
//
//  Created by Ricardo Pereira on 05/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import UIKit

open class WSScrollViewController: UIViewController {

    public lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}
