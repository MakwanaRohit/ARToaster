//
//  Extension.swift
//  ARToasterView
//
//  Created by Rohit Makwana on 09/11/20.
//  Copyright © 2020 Rohit Makwana. All rights reserved.
//

import UIKit

extension UIApplication {
    static var statusBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            let window = shared.windows.filter { $0.isKeyWindow }.first
            return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        }
        else {
            return shared.statusBarFrame.height
        }
    }

    static let top_padding      = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0.0
    static let bottom_padding   = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        }
        else {
            return UIApplication.shared.keyWindow
        }
    }
}

extension UIView {

    func cornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }

    func applyShadow(WithColor color: UIColor, opacity: Float , radius: CGFloat) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = radius
        self.clipsToBounds = false
    }
}
