//
//  WSPopupActionable.swift
//  WSPopupExample
//
//  Created by Ricardo Pereira on 06/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import Foundation

public typealias WSPopupActionCompletion = () -> Void

public protocol WSPopupActionable {
    var popupDismissHandler: ((WSPopupActionCompletion?) -> Void)? { get set }
    func dismissPopup(completion: (() -> Void)?)
}

public extension WSPopupActionable {

    func dismissPopup(completion: (() -> Void)? = nil) {
        popupDismissHandler?(completion)
    }
    
}
