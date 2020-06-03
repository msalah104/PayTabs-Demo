//
//  PTConfigurationsViewController.swift
//  PayTabsDemo
//
//  Created by Mohammed Salah on 03/06/2020.
//  Copyright © 2020 MSalah. All rights reserved.
//

import Swinject
import UIKit
class PTConfigurationsViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet var customerNameIV: InputFieldView!
    @IBOutlet var currencyCodeIV: InputFieldView!
    @IBOutlet var taxAmountIV: InputFieldView!
    @IBOutlet var amountIV: InputFieldView!
    @IBOutlet var sdkLanguageIV: InputFieldView!
    @IBOutlet var shippingAddressIV: InputFieldView!
    @IBOutlet var shippingCityIV: InputFieldView!
    @IBOutlet var shippingCountryIV: InputFieldView!
    @IBOutlet var shippingStateIV: InputFieldView!
    @IBOutlet var shippingZIPCodeIV: InputFieldView!
    @IBOutlet var billingAddressIV: InputFieldView!
    @IBOutlet var billingCityIV: InputFieldView!
    @IBOutlet var billingCountryIV: InputFieldView!
    @IBOutlet var billingStateIV: InputFieldView!
    @IBOutlet var billingZIPCodeIV: InputFieldView!
    @IBOutlet var orderIDIV: InputFieldView!
    @IBOutlet var phoneNumberIV: InputFieldView!
    @IBOutlet var customerEmailIV: InputFieldView!
    @IBOutlet var assigneeCodeIV: InputFieldView!

    // MARK: - Properties

    var viewModel: ChceckoutViewModel!
    var validator: Validator = Validator()
    static let DefaultRequiredMessage = "This field is required"
    let DefaultRequiredRule = RequiredRule(message: DefaultRequiredMessage)
    let container = AppDelegate.getContainer()

    // MARK: - Core

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = container.resolve(ChceckoutViewModel.self)
        setupViews()
    }

    func setupViews() {
        // Setup Input type, by default it's text
        customerEmailIV.inputType = .email
        assigneeCodeIV.inputType = .email
        taxAmountIV.inputType = .number
        amountIV.inputType = .number
        phoneNumberIV.inputType = .phone

        // register input views with the validator
        validator.registerInputView(customerNameIV, rules: [DefaultRequiredRule])
        validator.registerInputView(currencyCodeIV, rules: [DefaultRequiredRule])
        validator.registerInputView(taxAmountIV, rules: [DefaultRequiredRule])
        validator.registerInputView(amountIV, rules: [DefaultRequiredRule])
        validator.registerInputView(sdkLanguageIV, rules: [DefaultRequiredRule])
        validator.registerInputView(shippingAddressIV, rules: [DefaultRequiredRule])
        validator.registerInputView(shippingCityIV, rules: [DefaultRequiredRule])
        validator.registerInputView(shippingCountryIV, rules: [DefaultRequiredRule])
        validator.registerInputView(shippingStateIV, rules: [DefaultRequiredRule])
        validator.registerInputView(shippingZIPCodeIV, rules: [DefaultRequiredRule])
        validator.registerInputView(billingAddressIV, rules: [DefaultRequiredRule])
        validator.registerInputView(billingCityIV, rules: [DefaultRequiredRule])
        validator.registerInputView(billingCountryIV, rules: [DefaultRequiredRule])
        validator.registerInputView(billingStateIV, rules: [DefaultRequiredRule])
        validator.registerInputView(billingZIPCodeIV, rules: [DefaultRequiredRule])
        validator.registerInputView(orderIDIV, rules: [DefaultRequiredRule])
        validator.registerInputView(phoneNumberIV, rules: [DefaultRequiredRule])
        validator.registerInputView(customerEmailIV, rules: [DefaultRequiredRule, EmailRule()])
        validator.registerInputView(assigneeCodeIV, rules: [DefaultRequiredRule])

        // For testing
        addDummyDataForTesting()
    }

    func addDummyDataForTesting() {
        customerNameIV.text = "PayTabs Demo App"
        currencyCodeIV.text = "USD"
        taxAmountIV.text = "0.0"
        amountIV.text = "5.0"
        sdkLanguageIV.text = "en"
        shippingAddressIV.text = "Manama"
        shippingCityIV.text = "Manama"
        shippingCountryIV.text = "BHR"
        shippingStateIV.text = "Manama"
        shippingZIPCodeIV.text = "123456"
        billingAddressIV.text = "Manama"
        billingCityIV.text = "Manama"
        billingCountryIV.text = "BHR"
        billingStateIV.text = "Manama"
        billingZIPCodeIV.text = "123456"
        orderIDIV.text = "12345"
        phoneNumberIV.text = "0097333109781"
        customerEmailIV.text = "rhegazy@paytabs.com"
        assigneeCodeIV.text = "SDK"
    }

    @IBAction func didPressContinue(_: UIButton) {
        validator.validate(self)
    }
}

extension PTConfigurationsViewController: ValidationDelegate {
    func validationSuccessful() {
        let checkoutNV = storyboard?.instantiateViewController(withIdentifier: "ChechoutViewController") as? UINavigationController
        let checkoutVC = checkoutNV?.viewControllers.first as? ChechoutViewController

        // Pass the configuration data
        viewModel.customerName = customerNameIV.text
        viewModel.amount = (amountIV.text as NSString).floatValue
        viewModel.taxAmount = (taxAmountIV.text as NSString).floatValue
        viewModel.currencyCode = currencyCodeIV.text
        viewModel.sdkLanguage = sdkLanguageIV.text
        viewModel.shippingAddress = shippingAddressIV.text
        viewModel.shippingCity = shippingCityIV.text
        viewModel.shippingCountry = shippingCountryIV.text
        viewModel.shippingState = shippingStateIV.text
        viewModel.shippingZIPCode = shippingZIPCodeIV.text
        viewModel.billingAddress = billingAddressIV.text
        viewModel.billingCity = billingCityIV.text
        viewModel.billingCountry = billingCountryIV.text
        viewModel.billingState = billingStateIV.text
        viewModel.billingZIPCode = billingZIPCodeIV.text
        viewModel.orderID = orderIDIV.text
        viewModel.phoneNumber = phoneNumberIV.text
        viewModel.customerEmail = customerEmailIV.text
        viewModel.assigneeCode = assigneeCodeIV.text

        checkoutVC?.viewModel = viewModel
        navigationController?.present(checkoutNV ?? UIViewController(), animated: false, completion: nil)
    }

    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        print("Error: \(errors.first?.1.errorMessage ?? "")")
    }
}
