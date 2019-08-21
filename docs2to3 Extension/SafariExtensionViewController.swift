//
//  SafariExtensionViewController.swift
//  docs2to3 Extension
//
//  Created by Daniel Grießhaber on 21.08.19.
//  Copyright © 2019 Daniel Grießhaber. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:320, height:240)
        return shared
    }()

}
