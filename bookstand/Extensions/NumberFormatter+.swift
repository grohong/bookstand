//
//  NumberFormatter+.swift
//  bookstand
//
//  Created by sh.hong on 2021/09/08.
//

import Foundation

extension NumberFormatter {

    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency
        return formatter
    }()
}
