//
//  ChceckoutViewModel.swift
//  PayTabsDemo
//
//  Created by Mohammed Salah on 03/06/2020.
//  Copyright © 2020 MSalah. All rights reserved.
//

import UIKit

class ChceckoutViewModel: NSObject {
    // MARK: - Properties

    private var ptInfo: PayTabsInfo!
    var customerName = ""
    var currencyCode = ""
    var taxAmount: Float = 0.0
    var amount: Float = 5.0
    var sdkLanguage = ""
    var shippingAddress = ""
    var shippingCity = ""
    var shippingCountry = ""
    var shippingState = ""
    var shippingZIPCode = ""
    var billingAddress = ""
    var billingCity = ""
    var billingCountry = ""
    var billingState = ""
    var billingZIPCode = ""
    var orderID = ""
    var phoneNumber = ""
    var customerEmail = ""
    var assigneeCode = ""

    var merchantEmail: String {
        ptInfo.merchantEmail
    }

    var merchantSecretKey: String {
        ptInfo.merchantSecretKey
    }

    init(ptInfo: PayTabsInfo) {
        self.ptInfo = ptInfo
    }
}
