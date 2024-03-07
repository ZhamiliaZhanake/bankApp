//
//  ValidationProtovol.swift
//  bankApp
//
//  Created by Zhamilia Zhanakeeva on 6/3/24.
//

import Foundation
protocol TransferValidation {
    func isValidSendingCardNumber(_ cardNumber: String) -> Bool
    func isValidSendingAmount(_ amount: Double, userAmount: Double) -> Bool
}

extension TransferValidation {
    func isValidSendingCardNumber(_ cardNumber: String) -> Bool {
        let numericCharacterSet = CharacterSet.decimalDigits
        return cardNumber.count == 16 && cardNumber.rangeOfCharacter(from: numericCharacterSet.inverted) == nil
    }

    func isValidSendingAmount(_ amount: Double, userAmount: Double) -> Bool {
        return amount > 20 && amount <= userAmount
    }
}
