//
//  Date+Extension.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 03/04/24.
//

import Foundation

extension Date {
    var convertDateInString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: self)
    }
}
