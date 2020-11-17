//
//  ViewController.swift
//  ARToasterView
//
//  Created by Rohit Makwana on 06/11/20.
//  Copyright © 2020 Rohit Makwana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var statusSegment: UISegmentedControl!

    let staticMessage = "Copyright © 2020 Rohit Makwana. All rights reserved."

    override func viewDidLoad() {
        super.viewDidLoad()

        self.statusSegment.addTarget(self, action: #selector(self.statusSegmentedAction(_:)), for: .valueChanged)
    }

    @objc fileprivate func statusSegmentedAction(_ sender: UISegmentedControl) {

        if sender.selectedSegmentIndex == 0 {
            ARToaster(message: staticMessage, duration: 3, position: .top, status: .success).show()
        }
        else if sender.selectedSegmentIndex == 1 {
            ARToaster(message: staticMessage, duration: 3, position: .center, status: .warning).show()
        }
        else if sender.selectedSegmentIndex == 2 {
            ARToaster(message: staticMessage, duration: 3, position: .bottom, status: .error).show()
        }
        else if sender.selectedSegmentIndex == 3 {
            ARToaster(message: staticMessage, duration: 3, position: .bottom, status: .normal).show()
        }
    }
}

