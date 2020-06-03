//
//  PayTabsInfo.swift
//  PayTabsDemo
//
//  Created by Mohammed Salah on 03/06/2020.
//  Copyright © 2020 MSalah. All rights reserved.
//

import UIKit

protocol PayTabsInfo: Any {
    var merchantEmail: String! { get }
    var merchantSecretKey: String! { get }
}

extension PayTabsInfo {
    var merchantEmail: String! {
        return ""
    }

    var merchantSecretKey: String! {
        return ""
    }
}

class PayTabsInfoSDKDemoKey: PayTabsInfo {
    var merchantEmail: String! {
        return getMerchantEmail()
    }

    var merchantSecretKey: String! {
        return getMerchantSecretKey()
    }

    fileprivate var info: [String: String] = [:]

    init() {
        let fileName = "DemoKey"
        let apiKeyPath = Bundle.main.url(forResource: fileName, withExtension: "plist")
        info = NSDictionary(contentsOf: apiKeyPath!) as! [String: String]
    }

    private func getMerchantEmail() -> String {
        return info["email"] ?? ""
    }

    private func getMerchantSecretKey() -> String {
        return info["key"] ?? ""
    }
}

class PayTabsInfoDemoKey: PayTabsInfoSDKDemoKey {
    override init() {
        super.init()
        let fileName = "PTDemoKey"
        let apiKeyPath = Bundle.main.url(forResource: fileName, withExtension: "plist")
        info = NSDictionary(contentsOf: apiKeyPath!) as! [String: String]
    }
}
