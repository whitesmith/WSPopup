//
//  ExampleIntrinsicHeightView.swift
//  WSPopup
//
//  Created by Ricardo Pereira on 04/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import UIKit

class ExampleIntrinsicHeightView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red

        let titleLabel = UILabel()
        titleLabel.text = "OMG!\nOMG!\nOMG!"
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
