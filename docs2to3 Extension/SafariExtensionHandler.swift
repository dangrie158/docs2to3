//
//  SafariExtensionHandler.swift
//  docs2to3 Extension
//
//  Created by Daniel Grießhaber on 21.08.19.
//  Copyright © 2019 Daniel Grießhaber. All rights reserved.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        // This method will be called when a content script provided by your extension calls safari.extension.dispatchMessage("message").
        
        let defaults = UserDefaults(suiteName: Constants.defaultsSuite)
        let targetVersion = defaults!.integer(forKey: Constants.keyTargetVersion)
        let targetVersionUrl = Constants.versionUrls[targetVersion]!
        
        if messageName == "getConfig" {
            page.dispatchMessageToScript(withName: "config", userInfo: ["targetVersion": targetVersionUrl])
        }
        
    }
}
