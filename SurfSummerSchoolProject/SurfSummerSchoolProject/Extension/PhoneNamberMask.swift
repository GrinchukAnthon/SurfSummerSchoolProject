//
//  PhoneNamberMask.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 21.08.2022.
//

import UIKit

extension AuthorizationLoginTableViewCell: UITextFieldDelegate {
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let fullString = (textField.text ?? "") + string
        textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
        return false
    }
    
    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+" }
        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = Constants.regex.stringByReplacingMatches(
            in: phoneNumber,
            options: [],
            range: range,
            withTemplate: ""
        )
        if number.count > Constants.maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: Constants.maxNumberCount)
            number = String(number[number.startIndex..<maxIndex])
        }
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regGange = number.startIndex..<maxIndex
        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3",
                options: .regularExpression,
                range: regGange
            )
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3-$4-$5",
                options: .regularExpression,
                range: regGange
            )
        }
        return "+\(number)"
    }
}
