//
//  WSPopupViewController.swift
//  WSPopup
//
//  Created by Ricardo Pereira on 04/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import UIKit

public class WSPopupViewController: WSScrollViewController {

    let viewType: UIView.Type

    let popupView: UIView

    public init(viewType: UIView.Type) {
        self.viewType = viewType
        self.popupView = viewType.init(frame: .null)
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        scrollView.alwaysBounceVertical = true

        popupView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(popupView)

        NSLayoutConstraint.activate([
            popupView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            popupView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            popupView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            popupView.topAnchor.constraint(equalTo: scrollView.topAnchor).priority(of: .defaultLow),
            popupView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).priority(of: .defaultLow),
            popupView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).priority(of: .defaultLow),
            popupView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).priority(of: .defaultLow),
        ])
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerKeyboardNotifications()
        registerTextFieldNotifications()
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        unregisterKeyboardNotifications()
        unregisterTextFieldNotifications()
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }

    private func registerTextFieldNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.textDidBeginEditing(_:)),
            name: UITextField.textDidBeginEditingNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.textDidEndEditing(_:)),
            name: UITextField.textDidEndEditingNotification,
            object: nil
        )
    }

    private func unregisterTextFieldNotifications() {
        NotificationCenter.default.removeObserver(
            self,
            name: UITextField.textDidBeginEditingNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UITextField.textDidEndEditingNotification,
            object: nil
        )
    }

    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillChangeFrame(_:)),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }

    private func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }

    @objc private func textDidBeginEditing(_ sender: Notification) {
        print("textDidBeginEditing:", sender.object as? UITextField ?? "nil")
    }

    @objc private func textDidEndEditing(_ sender: Notification) {
        print("textDidEndEditing:", sender.object as? UITextField ?? "nil")
    }

    @objc private func keyboardWillShow(_ sender: Notification) {
        print("keyboardWillShow:")
        guard let value = sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        let keyboardFrame = value.cgRectValue
        print(keyboardFrame.height)
    }

    @objc private func keyboardWillHide(_ sender: Notification) {
        print("keyboardWillHide:")
    }

    @objc private func keyboardWillChangeFrame(_ sender: Notification) {
        print("keyboardWillChangeFrame:")
    }

}

extension NSLayoutConstraint {

    func priority(of value: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = value
        return self
    }

}
