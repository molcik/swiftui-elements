//
//  Sheet.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Sheet<Content: View> : View {
    
    var content: () -> Content
    var body: some View {
        
        return Group {
            self.content()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(Color.white)
        .cornerRadius(10.0)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
        .offset(y: 200)
        .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
    }
    
}
