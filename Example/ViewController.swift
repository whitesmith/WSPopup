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

    lazy var modalLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Modal Login", for: .normal)
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
        view.addSubview(modalLoginButton)
        loginButton.addTarget(self, action: #selector(self.loginButtonTapped), for: .touchUpInside)
        tableViewButton.addTarget(self, action: #selector(self.tableViewButtonTapped), for: .touchUpInside)
        modalLoginButton.addTarget(self, action: #selector(self.modalLoginButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
        NSLayoutConstraint.activate([
            tableViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableViewButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            modalLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modalLoginButton.topAnchor.constraint(equalTo: tableViewButton.bottomAnchor, constant: 10),
        ])
    }

    @objc func loginButtonTapped(_ sender: Any) {
        exampleSignInView.userTextField.text = "JohnDoe123"

        popupViewController.dimissPopupOnSlideDownGesture = false
        popupViewController.dimissPopupOnTapGesture = false
        popupViewController.modalPresentationStyle = .overCurrentContext
        popupViewController.modalTransitionStyle = .crossDissolve
        show(popupViewController, sender: self)
    }

    @objc func tableViewButtonTapped(_ sender: Any) {
        show(ExampleSignInViewController(), sender: self)
    }

    @objc func modalLoginButtonTapped() {
        let popupViewController = WSPopupViewController(popupViewType: ExampleSignInView.self)
        popupViewController.dimissPopupOnSlideDownGesture = true
        popupViewController.dimissPopupOnTapGesture = false
        if #available(iOS 13, *) {
            popupViewController.modalPresentationStyle = .overFullScreen
        }
        else {
            popupViewController.modalPresentationStyle = .overCurrentContext
        }
        popupViewController.modalTransitionStyle = .crossDissolve
        present(popupViewController, animated: true, completion: nil)
    }

}
