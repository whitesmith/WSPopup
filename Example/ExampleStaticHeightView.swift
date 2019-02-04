//
//  ExampleStaticHeightView.swift
//  WSPopup
//
//  Created by Ricardo Pereira on 04/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import UIKit

class ExampleStaticHeightView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red

        let titleLabel = UILabel()
        titleLabel.text = "OMG!"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
