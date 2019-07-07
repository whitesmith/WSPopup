//
//  ExampleSignInViewController.swift
//  WSPopupExample
//
//  Created by Ricardo Pereira on 07/07/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import WSPopup

class ExampleSignInViewController: WSPopupViewController {

    let exampleSignInView = ExampleSignInView()

    init() {
        super.init(popupView: exampleSignInView)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        exampleSignInView.userTextField.text = "JohnDoe123"
    }

}
