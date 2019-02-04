//
//  WSPopupViewController.swift
//  WSPopup
//
//  Created by Ricardo Pereira on 04/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import UIKit

class WSPopupViewController: UIViewController {

    let viewType: UIView.Type

    let popupView: UIView

    init(viewType: UIView.Type) {
        self.viewType = viewType
        self.popupView = viewType.init(frame: .null)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)

        NSLayoutConstraint.activate([
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            popupView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
        ])
    }

}
