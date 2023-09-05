//
//  UserMainViewModel.swift
//  FriendFace
//
//  Created by Isaque da Silva on 02/09/23.
//

import Foundation

extension UserMainView {
    class UserMainViewModel: ObservableObject {
        var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
    }
}
