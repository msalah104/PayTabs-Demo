//
//  PhoneNumberOperatorRule.swift
//  Tasawwaq
//
//  Created by Mohammed Salah on 3/17/19.
//

import UIKit

class PhoneNumberOperatorRule: Rule {
    /// Error message to be displayed if validation fails.
    private var message: String
    private var operatorNumber: String

    /**
     Initializes a `FullNameRule` object that is used to verify that text in field is a full name.

     - parameter message: String of error message.
     - returns: An initialized `FullNameRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(operatorNumber: String, message: String = "Please provide the right operator number") {
        self.message = message
        self.operatorNumber = operatorNumber
    }

    /**
     Used to validate a field.

     - parameter value: String to checked for validation.
     - returns: A boolean value. True if validation is successful; False if validation fails.
     */
    public func validate(_ value: String) -> Bool {
        return value.hasPrefix(operatorNumber)
    }

    /**
     Used to display error message of a field that has failed validation.

     - returns: String of error message.
     */
    public func errorMessage() -> String {
        return message
    }
}
