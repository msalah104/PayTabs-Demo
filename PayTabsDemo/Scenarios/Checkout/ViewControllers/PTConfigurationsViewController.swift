//
//  PTConfigurationsViewController.swift
//  PayTabsDemo
//
//  Created by Mohammed Salah on 03/06/2020.
//  Copyright © 2020 MSalah. All rights reserved.
//

import UIKit

class PTConfigurationsViewController: UIViewController {
    
    @IBOutlet weak var customerNameIV: InputFieldView!
    @IBOutlet weak var currencyCodeIV: InputFieldView!
    @IBOutlet weak var taxAmountIV: InputFieldView!
    @IBOutlet weak var amountIV: InputFieldView!
    @IBOutlet weak var sdkLanguageIV: InputFieldView!
    @IBOutlet weak var shippingAddressIV: InputFieldView!
    @IBOutlet weak var shippingCityIV: InputFieldView!
    @IBOutlet weak var shippingCountryIV: InputFieldView!
    @IBOutlet weak var shippingStateIV: InputFieldView!
    @IBOutlet weak var shippingZIPCodeIV: InputFieldView!
    @IBOutlet weak var billingAddressIV: InputFieldView!
    @IBOutlet weak var billingCityIV: InputFieldView!
    @IBOutlet weak var billingCountryIV: InputFieldView!
    @IBOutlet weak var billingStateIV: InputFieldView!
    @IBOutlet weak var billingZIPCodeIV: InputFieldView!
    @IBOutlet weak var orderIDIV: InputFieldView!
    @IBOutlet weak var phoneNumberIV: InputFieldView!
    @IBOutlet weak var customerEmailIV: InputFieldView!
    @IBOutlet weak var merchantEmailIV: InputFieldView!
    
    var validator:Validator = Validator()
    static let DefaultRequiredMessage = "This field is required"
    let DefaultRequiredRule = RequiredRule(message: DefaultRequiredMessage)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        // Setup Input type, by default it's text
        customerEmailIV.inputType = .email
        merchantEmailIV.inputType = .email
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
        validator.registerInputView(merchantEmailIV, rules: [DefaultRequiredRule, EmailRule()])
        
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
        merchantEmailIV.text = "rhegazy@paytabs.com"
    }
    
    @IBAction func didPressContinue(_ sender:UIButton) {
        validator.validate(self)
    }

}

extension PTConfigurationsViewController: ValidationDelegate {
    func validationSuccessful() {
        
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        
    }
    
    
}
