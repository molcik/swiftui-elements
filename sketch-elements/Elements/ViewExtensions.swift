//
//  ViewExtensions.swift
//  sketch-elements
//
//  Created by Filip Molcik on 14/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

extension View {
    
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
    
    func tabBarOpaque() -> some View {
        self.modifier(TabBarModifier())
    }
    
    func halfSheet<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View {
        // return self.modifier(ModalView(isPresented: isPresented))
        return self
    }
    
}

