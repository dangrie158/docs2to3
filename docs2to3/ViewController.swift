//
//  ViewController.swift
//  docs2to3
//
//  Created by Daniel Grießhaber on 21.08.19.
//  Copyright © 2019 Daniel Grießhaber. All rights reserved.
//

import Cocoa
import SafariServices.SFSafariApplication

class ViewController: NSViewController {

    @IBOutlet var appNameLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appNameLabel.stringValue = "docs2to3";
    }
    
    @IBAction func openSafariExtensionPreferences(_ sender: AnyObject?) {
        SFSafariApplication.showPreferencesForExtension(withIdentifier: "de.danielgriesshaber.docs2to3-Extension") { error in
            if let _ = error {
                // Insert code to inform the user that something went wrong.

            }
        }
    }

}
