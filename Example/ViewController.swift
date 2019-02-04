//
//  ViewController.swift
//  PopupExample
//
//  Created by Ricardo Pereira on 04/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showtimeTapped(_ sender: Any) {
        let popupViewController = WSPopupViewController(viewType: SignInExampleView.self)
        popupViewController.modalPresentationStyle = .overCurrentContext
        popupViewController.modalTransitionStyle = .crossDissolve
        show(popupViewController, sender: self)
    }

}
