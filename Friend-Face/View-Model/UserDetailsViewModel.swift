//
//  UserDetailsViewModel.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import Foundation

extension UserDetailsView {
    class UserDetailsViewModel: ObservableObject {
        var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
    }
}
