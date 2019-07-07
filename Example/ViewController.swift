//
//  ViewController.swift
//  PopupExample
//
//  Created by Ricardo Pereira on 04/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import UIKit
import WSPopup

class ViewController: UIViewController {

    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Example Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var tableViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Example Table View", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var exampleSignInView = ExampleSignInView()
    lazy var popupViewController = WSPopupViewController(popupView: exampleSignInView)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginButton)
        view.addSubview(tableViewButton)
        loginButton.addTarget(self, action: #selector(self.loginButtonTapped), for: .touchUpInside)
        tableViewButton.addTarget(self, action: #selector(self.tableViewButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
        NSLayoutConstraint.activate([
            tableViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableViewButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
        ])
    }

    @objc func loginButtonTapped(_ sender: Any) {
        exampleSignInView.userTextField.text = "JohnDoe123"
        //let popupViewController = WSPopupViewController(popupViewType: ExampleSignInView.self)
        popupViewController.dimissPopupOnSlideDownGesture = false
        popupViewController.dimissPopupOnTapGesture = false
        popupViewController.modalPresentationStyle = .overCurrentContext
        popupViewController.modalTransitionStyle = .crossDissolve
        show(popupViewController, sender: self)
    }

    @objc func tableViewButtonTapped(_ sender: Any) {
        show(ExampleSignInViewController(), sender: self)
    }

}
