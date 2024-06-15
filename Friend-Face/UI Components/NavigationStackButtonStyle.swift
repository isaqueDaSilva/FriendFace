//
//  NavigationStackButtonStyle.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 16/03/24.
//

import SwiftUI

struct NavigationStackButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
}

extension View {
    func navigationStackButtonStyle() -> some View {
        buttonStyle(NavigationStackButtonStyle())
    }
}
