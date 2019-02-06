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

    lazy var showtimeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Showtime", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(showtimeButton)
        showtimeButton.addTarget(self, action: #selector(self.showtimeTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            showtimeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showtimeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
    }

    @objc func showtimeTapped(_ sender: Any) {
        let exampleSignInView = ExampleSignInView()
        exampleSignInView.userTextField.text = "JohnDoe123"
        let popupViewController = WSPopupViewController(popupView: exampleSignInView)
        //let popupViewController = WSPopupViewController(popupViewType: ExampleSignInView.self)
        popupViewController.modalPresentationStyle = .overCurrentContext
        popupViewController.modalTransitionStyle = .crossDissolve
        show(popupViewController, sender: self)
    }

}
