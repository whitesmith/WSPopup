//
//  ExampleSignInViewController.swift
//  WSPopupExample
//
//  Created by Ricardo Pereira on 07/07/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import WSPopup

class ExampleSignInViewController: WSPopupViewController {

    let exampleView = ExampleTableView()

    init() {
        super.init(popupView: exampleView)
        exampleView.delegate = self
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
        cancelsTouchesInView = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        exampleView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }

}

extension ExampleSignInViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath.row)
    }

}

class ExampleTableView: UITableView, UITableViewDataSource {

    let examples = ["A", "B", "C"]

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = examples[indexPath.row]
        return cell
    }

}
