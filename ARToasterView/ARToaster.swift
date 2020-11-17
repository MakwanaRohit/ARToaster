//
//  ARToaster.swift
//  ARToasterView
//
//  Created by Rohit Makwana on 11/11/20.
//  Copyright © 2020 Rohit Makwana. All rights reserved.
//

import UIKit

class ARToaster: UIView {

    private(set) var config : ARToasterConfigs!
    private let labelPadding : CGFloat = 15
    private var timer : Timer? = nil
    private var position : Position = .top
    private var duration : Double?

    private lazy var messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var statusImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .clear
        return imageView
    }()

    private(set) var status : ARStatus = .normal
    public convenience init(message: String,
                            duration: Double? = 3.0,
                            position: Position = .top,
                            status: ARStatus = ARStatus.normal,
                            config:ARToasterConfigs = ARToasterConfigs.shared) {

        let messageAttributed = NSAttributedString(string: message, attributes: [.font: config.messageFont,
                                                                                 .foregroundColor:config.messageColor])
        self.init(message: messageAttributed,
                  duration: duration,
                  position: position,
                  status: status,
                  config:config)
    }

    public init(message: NSAttributedString,
                duration: Double? = 3.0,
                position: Position = .top,
                status: ARStatus = ARStatus.normal,
                config:ARToasterConfigs = ARToasterConfigs.shared) {

        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        statusImageView.translatesAutoresizingMaskIntoConstraints = false

        self.status = status
        self.config = config
        self.messageLabel.attributedText = message
        self.position = position
        self.duration = duration
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initilizeUI() {

        for views in UIWindow.key!.subviews {
            if let view = views as? ARToaster {
                view.hide()
            }
        }

        UIWindow.key!.addSubview(self)
        self.backgroundColor = self.config.backgrounColor
        self.addSubview(self.messageLabel)

        messageLabel.textAlignment = config.messageAlignment
        messageLabel.font = config.messageFont

        var viewConstraints = [self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor),
                               self.widthAnchor.constraint(equalTo: superview!.widthAnchor, multiplier: 0.75)]
        if position == .top {
            viewConstraints.append(self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: UIApplication.top_padding))
        }
        else if position == .bottom {
            if #available(iOS 11.0, *) {
                viewConstraints.append(self.bottomAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.bottomAnchor, constant: -10))
            } else {
                viewConstraints.append(self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: -10))
            }
        }
        else {
            viewConstraints.append(self.centerYAnchor.constraint(equalTo: superview!.centerYAnchor))
        }
        NSLayoutConstraint.activate(viewConstraints)

        var labelConstraints = [messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: labelPadding),
                                messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -labelPadding),
                                messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -labelPadding)]

        if self.status != .normal {
            self.addSubview(self.statusImageView)
            self.statusImageView.image = self.getImage()

            NSLayoutConstraint.activate([statusImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: labelPadding),
                                         statusImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                         statusImageView.widthAnchor.constraint(equalToConstant: 20),
                                         statusImageView.heightAnchor.constraint(equalToConstant: 20)])
            labelConstraints.append(messageLabel.leadingAnchor.constraint(equalTo: self.statusImageView.trailingAnchor, constant: 10))
        }
        else{
            labelConstraints.append(messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
        }

        NSLayoutConstraint.activate(labelConstraints)

        self.layoutIfNeeded()
        self.cornerRadius(10)
        self.applyShadow(WithColor: .black, opacity: 0.3, radius: 10)
        self.alpha = 0.0
    }

    @objc fileprivate func closeButotnAction(_ sender: UIButton) {
        self.hide()
    }

    fileprivate func getImage() -> UIImage? {

        switch self.status {
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

    public func show() {

        self.initilizeUI()
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
            self.alpha = 1
            self.transform = .identity
        }) { (B) in
            self.hide(CGFloat(self.duration ?? 3.0))
        }
    }

    @objc public func hide(_ delay: CGFloat = 0.0) {
        UIView.animate(withDuration: 0.3, delay: TimeInterval(delay), options: .curveEaseInOut, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { (B) in
            self.removeFromSuperview()
        }
    }
}
