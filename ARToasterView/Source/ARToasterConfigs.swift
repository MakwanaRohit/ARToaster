//
//  ARToasterConfigs.swift
//  ARToasterView
//
//  Created by Rohit Makwana on 09/11/20.
//  Copyright © 2020 Rohit Makwana. All rights reserved.
//

import UIKit

public struct ARToasterConfigs {

    public static var shared = ARToasterConfigs()
    public var messageColor = UIColor.white
    public var messageFont = UIFont.systemFont(ofSize: 15)
    public var messageAlignment = NSTextAlignment.left
    public var backgrounColor = UIColor.black

    public mutating func setBackgroundColor(_ color: UIColor?) {
        guard let clr = color else { return }
        backgrounColor = clr
    }
}

public enum Position {
    case top
    case center
    case bottom
}

public enum ARStatus : CaseIterable {
    case success
    case error
    case warning
    case normal

    var image: UIImage? {
        switch self {
        case .success:
            return #imageLiteral(resourceName: "ic_checkmark")
        case .error:
            return #imageLiteral(resourceName: "ic_error")
        case .warning:
            return #imageLiteral(resourceName: "ic_warning")
        case .normal:
            return nil
        }
    }
}

