//
//  ChechoutViewController.swift
//  PayTabsDemo
//
//  Created by Mohammed Salah on 03/06/2020.
//  Copyright © 2020 MSalah. All rights reserved.
//

import UIKit

class ChechoutViewController: UIViewController {
    
    var ptViewController: PTFWInitialSetupViewController!
    var customerName = ""
    var currencyCode = ""
    var taxAmount:Float = 0.0
    var amount:Float = 5.0
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
    var merchantEmail = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPayTabsSDK()
    }
    
    
    func setupPayTabsSDK() {
        
        let bundle = Bundle(url: Bundle.main.url(forResource: "Resources", withExtension: "bundle")!)
        
        self.ptViewController = PTFWInitialSetupViewController.init(
            bundle: bundle,
            andWithViewFrame: self.view.frame,
            andWithAmount: amount,
            andWithCustomerTitle: customerName,
            andWithCurrencyCode: currencyCode,
            andWithTaxAmount: taxAmount,
            andWithSDKLanguage: sdkLanguage,
            andWithShippingAddress: shippingAddress,
            andWithShippingCity: shippingCity,
            andWithShippingCountry: shippingCountry,
            andWithShippingState: shippingState,
            andWithShippingZIPCode: shippingZIPCode,
            andWithBillingAddress: billingAddress,
            andWithBillingCity: billingCity,
            andWithBillingCountry: billingCountry,
            andWithBillingState: billingState,
            andWithBillingZIPCode: billingZIPCode,
            andWithOrderID: orderID,
            andWithPhoneNumber: phoneNumber,
            andWithCustomerEmail: customerEmail,
            andIsTokenization:false,
            andIsPreAuth: false,
            andWithMerchantEmail: merchantEmail,
            andWithMerchantSecretKey: "BIueZNfPLblJnMmPYARDEoP5x1WqseI3XciX0yNLJ8v7URXTrOw6dmbKn8bQnTUk6ch6L5SudnC8fz2HozNBVZlj7w9uq4Pwg7D1",
            andWithAssigneeCode: "SDK",
            andWithThemeColor:UIColor.mainBlue,
            andIsThemeColorLight: false)
        
        self.ptViewController.didReceiveBackButtonCallback = { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
        
        self.ptViewController.didStartPreparePaymentPage = {
            // Start Prepare Payment Page
            // Show loading indicator
        }
        self.ptViewController.didFinishPreparePaymentPage = {
            // Finish Prepare Payment Page
            // Stop loading indicator
        }
        
        self.ptViewController.didReceiveFinishTransactionCallback = { [unowned self](responseCode, result, transactionID, tokenizedCustomerEmail, tokenizedCustomerPassword, token, transactionState) in
            print("Response Code: \(responseCode)")
            print("Response Result: \(result)")
            
            // In Case you are using tokenization
            print("Tokenization Cutomer Email: \(tokenizedCustomerEmail)");
            print("Tokenization Customer Password: \(tokenizedCustomerPassword)");
            print("TOkenization Token: \(token)");
            
            let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "CheckoutResultViewController") as? CheckoutResultViewController
            resultVC?.code = "\(responseCode)"
            resultVC?.result = result
            resultVC?.email = tokenizedCustomerEmail
            resultVC?.pass = tokenizedCustomerPassword
            resultVC?.token = token
            
            self.navigationController?.show(resultVC ?? UIViewController(), sender: nil)
        }
        
        self.view.addSubview(ptViewController.view)
        self.addChild(ptViewController)
        
        ptViewController.didMove(toParent: self)
        
    }
}
