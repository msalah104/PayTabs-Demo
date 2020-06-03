//
//  CreditCardDateRule.swift
//  Fly365
//
//  Created by Mohammed Salah on 08/09/2019.
//  Copyright © 2019 Fly365. All rights reserved.
//

import UIKit

class CreditCardDateRule: Rule {
    func validate(_ value: String) -> Bool {
        if value.count != 5 {
            return false
        }

        let values = value.split(separator: "/", maxSplits: 2, omittingEmptySubsequences: false)
        let month = String(values.first ?? "1")
        let year = String(values.last ?? "1")

        let monthValue = Int(month)
        let yearValue = Int(year)
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date()) % 100

        if monthValue! > 12 || monthValue! < 1 {
            return false
        }

        if yearValue ?? 0 < currentYear {
            return false
        }

        return true
    }

    func errorMessage() -> String {
        return ""//FlyErrorMessages.DateInvalid
    }
}
