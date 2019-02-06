//
//  WSPopupViewController.swift
//  WSPopup
//
//  Created by Ricardo Pereira on 04/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import UIKit

public class WSPopupViewController: WSScrollViewController {

    private var activeInput: UIView?

    private let popupViewType: UIView.Type
    private let popupView: UIView

    public init(popupViewType: UIView.Type) {
        self.popupViewType = popupViewType
        self.popupView = popupViewType.init(frame: .null)
        super.init(nibName: nil, bundle: nil)
    }

    public init(popupView: UIView) {
        self.popupViewType = type(of: popupView)
        self.popupView = popupView
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        scrollView.alwaysBounceVertical = true
        scrollView.delegate = self
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))

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

        if var popupActionable = popupView as? WSPopupActionable {
            popupActionable.popupDismissHandler = { [weak self] in
                self?.dismissPopup()
            }
        }
        else {
            print("[WSPopup] PopupView of type '\(popupViewType)' does not conform to protocol 'WSPopupActionable'")
        }
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerKeyboardNotifications()
        registerTextFieldNotifications()
        registerTextViewNotifications()
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        unregisterKeyboardNotifications()
        unregisterTextFieldNotifications()
        unregisterTextViewNotifications()
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

    private func registerTextViewNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.textDidBeginEditing(_:)),
            name: UITextView.textDidBeginEditingNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.textDidEndEditing(_:)),
            name: UITextView.textDidEndEditingNotification,
            object: nil
        )
    }

    private func unregisterTextViewNotifications() {
        NotificationCenter.default.removeObserver(
            self,
            name: UITextView.textDidBeginEditingNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UITextView.textDidEndEditingNotification,
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
    }

    @objc public func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc public func dismissPopup() {
        dismissKeyboard()
        dismiss(animated: true, completion: nil)
    }

    @objc private func textDidBeginEditing(_ sender: Notification) {
        activeInput = sender.object as? UIView
    }

    @objc private func textDidEndEditing(_ sender: Notification) {
        activeInput = nil
    }

    @objc private func keyboardWillShow(_ sender: Notification) {
        guard let activeField = activeInput else {
            return
        }
        guard let value = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }

        // Reference: https://developer.apple.com/library/archive/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html#//apple_ref/doc/uid/TP40009542-CH5-SW7
        let keyboardSize = value.cgRectValue.size
        let contentInsets: UIEdgeInsets = .init(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets

        // If active text field is hidden by keyboard, scroll it so it's visible
        var rect = self.view.frame
        rect.size.height -= keyboardSize.height
        if !rect.contains(activeField.frame.origin) {
            self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
        }
    }

    @objc private func keyboardWillHide(_ sender: Notification) {
        let contentInsets: UIEdgeInsets = .zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

}

extension WSPopupViewController: UIScrollViewDelegate {

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }

    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //TODO: dismiss popup on slide down (scrollView.contentOffset.y)
    }

}

private extension NSLayoutConstraint {

    func priority(of value: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = value
        return self
    }

}