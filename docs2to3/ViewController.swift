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
    @IBOutlet weak var targetVersionSelector: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appNameLabel.stringValue = "docs2to3";
        let defaults = UserDefaults(suiteName: Constants.defaultsSuite)
        
        for version in Constants.versionNames.sorted(by: { $0.value < $1.value }) {
            
            targetVersionSelector.addItem(withTitle: version.value)
            targetVersionSelector.item(withTitle: version.value)?.tag = version.key
        }
        
        targetVersionSelector.selectItem(withTag: defaults?.integer(forKey: Constants.keyTargetVersion) ?? 0)
        
    }
    
    @IBAction func openSafariExtensionPreferences(_ sender: AnyObject?) {
        SFSafariApplication.showPreferencesForExtension(withIdentifier: "de.danielgriesshaber.docs2to3-Extension") { error in
            if let _ = error {
                // Insert code to inform the user that something went wrong.

            }
        }
    }

    @IBAction func onTargetVersionChanged(_ sender: Any) {
        let defaults = UserDefaults(suiteName: Constants.defaultsSuite)
        defaults?.set(targetVersionSelector.selectedTag(), forKey: Constants.keyTargetVersion)
    }
}
