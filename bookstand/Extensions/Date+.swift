//
//  Date+.swift
//  bookstand
//
//  Created by sh.hong on 2021/09/08.
//

import Foundation

extension Date {

    func string(_ dateStyle: DateFormatter.Style = .short) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        return dateFormatter.string(from: self)
    }
}
