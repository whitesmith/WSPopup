//
//  ExampleSignInView.swift
//  WSPopup
//
//  Created by Ricardo Pereira on 04/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import UIKit

class ExampleSignInView: UIView {

    //weak var delegate:

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        let titleLabel = UILabel()
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.text = "Welcome"
        titleLabel.textAlignment = .center
        stackView.addArrangedSubview(titleLabel)
        
        let subtitleLabel = UILabel()
        titleLabel.font = .preferredFont(forTextStyle: .subheadline)
        subtitleLabel.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        """
        subtitleLabel.numberOfLines = 0
        stackView.addArrangedSubview(subtitleLabel)

        let userTextField = UITextField()
        userTextField.placeholder = "Username"
        //userTextField.delegate
        stackView.addArrangedSubview(userTextField)

        let doneButton = UIButton(type: .system)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(doneButton)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func doneButtonTapped() {
        // TODO
    }

}
