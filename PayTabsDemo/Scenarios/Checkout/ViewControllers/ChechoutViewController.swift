//
//  ChechoutViewController.swift
//  PayTabsDemo
//
//  Created by Mohammed Salah on 03/06/2020.
//  Copyright © 2020 MSalah. All rights reserved.
//

import MBProgressHUD
import UIKit

class ChechoutViewController: UIViewController {
    var ptViewController: PTFWInitialSetupViewController!
    var viewModel: ChceckoutViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        MBProgressHUD.showAdded(to: view, animated: true)
        setupPayTabsSDK()
    }

    func setupPayTabsSDK() {
        let bundle = Bundle(url: Bundle.main.url(forResource: "Resources", withExtension: "bundle")!)
        ptViewController = PTFWInitialSetupViewController(
            bundle: bundle,
            andWithViewFrame: view.frame,
            andWithAmount: viewModel.amount,
            andWithCustomerTitle: viewModel.customerName,
            andWithCurrencyCode: viewModel.currencyCode,
            andWithTaxAmount: viewModel.taxAmount,
            andWithSDKLanguage: viewModel.sdkLanguage,
            andWithShippingAddress: viewModel.shippingAddress,
            andWithShippingCity: viewModel.shippingCity,
            andWithShippingCountry: viewModel.shippingCountry,
            andWithShippingState: viewModel.shippingState,
            andWithShippingZIPCode: viewModel.shippingZIPCode,
            andWithBillingAddress: viewModel.billingAddress,
            andWithBillingCity: viewModel.billingCity,
            andWithBillingCountry: viewModel.billingCountry,
            andWithBillingState: viewModel.billingState,
            andWithBillingZIPCode: viewModel.billingZIPCode,
            andWithOrderID: viewModel.orderID,
            andWithPhoneNumber: viewModel.phoneNumber,
            andWithCustomerEmail: viewModel.customerEmail,
            andIsTokenization: false,
            andIsPreAuth: true,
            andWithMerchantEmail: viewModel.merchantEmail,
            andWithMerchantSecretKey: viewModel.merchantSecretKey,
            andWithAssigneeCode: viewModel.assigneeCode,
            andWithThemeColor: UIColor.mainBlue,
            andIsThemeColorLight: false
        )

        ptViewController.didReceiveBackButtonCallback = { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }

        ptViewController.didStartPreparePaymentPage = {
            // Start Prepare Payment Page
            // Show loading indicator
        }
        ptViewController.didFinishPreparePaymentPage = {
            // Finish Prepare Payment Page
            // Stop loading indicator
            MBProgressHUD.hide(for: self.view, animated: true)
        }

        ptViewController.didReceiveFinishTransactionCallback = { [unowned self] responseCode, result, _, tokenizedCustomerEmail, tokenizedCustomerPassword, token, _ in
            print("Response Code: \(responseCode)")
            print("Response Result: \(result)")

            // In Case you are using tokenization
            print("Tokenization Cutomer Email: \(tokenizedCustomerEmail)")
            print("Tokenization Customer Password: \(tokenizedCustomerPassword)")
            print("TOkenization Token: \(token)")

            let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "CheckoutResultViewController") as? CheckoutResultViewController
            resultVC?.code = "\(responseCode)"
            resultVC?.result = result
            resultVC?.email = tokenizedCustomerEmail
            resultVC?.pass = tokenizedCustomerPassword
            resultVC?.token = token

            self.navigationController?.show(resultVC ?? UIViewController(), sender: nil)
        }

        view.addSubview(ptViewController.view)
        addChild(ptViewController)
        ptViewController.didMove(toParent: self)
    }
}
