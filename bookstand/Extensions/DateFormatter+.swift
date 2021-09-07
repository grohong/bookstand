//
//  DateFormatter+.swift
//  bookstand
//
//  Created by sh.hong on 2021/09/08.
//

import Foundation

extension DateFormatter {

  static let iso8601Full: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.locale = Locale.current
    return formatter
  }()
}

// https://useyourloaf.com/blog/swift-codable-with-custom-dates/
