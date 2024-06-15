//
//  UserDetailsViewModel.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import Foundation

extension UserDetailsView {
    class UserDetailsViewModel {
        let user: User
        
        var isActive: Bool {
            user.isActive
        }
        
        var isActiveIcon: String {
            user.isActive ? "😎" : "😴"
        }
        
        var name: String {
            user.name
        }
        
        var age: Int {
            user.age
        }
        
        var company: String {
            user.company
        }
        
        var email: String {
            user.email
        }
        
        var adress: String {
            user.address
        }
        
        var about: String {
            user.about
        }
        
        var registered: String {
            user.registered.convertDateInString
        }
        
        var tags: [User.Tag] {
            user.tags.map { User.Tag(tag: $0) }
        }
        
        var friends: [User.Friend] {
            user.friends
        }
        
        init(user: User) {
            self.user = user
        }
    }
}
