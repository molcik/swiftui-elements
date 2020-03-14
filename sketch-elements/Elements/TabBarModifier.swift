//
//  TabBarModifier.swift
//  sketch-elements
//
//  Created by Filip Molcik on 14/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct TabBarModifier: ViewModifier {
    init() {
        let opaqueAppearance = UITabBarAppearance()
        opaqueAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = opaqueAppearance
    }
    
    func body(content: Content) -> some View {
        content
    }
}
