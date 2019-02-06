//
//  WSPopupActionable.swift
//  WSPopupExample
//
//  Created by Ricardo Pereira on 06/02/2019.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import Foundation

public protocol WSPopupActionable {
    var popupDismissHandler: (() -> Void)? { get set }
    func dismissPopup()
}

public extension WSPopupActionable {

    public func dismissPopup() {
        popupDismissHandler?()
    }
    
}
