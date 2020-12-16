//
//  Button.swift
//  sketch-elements
//
//  Created by Filip Molcik on 08/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonPrimary<Content: View>: View {
    
    var action: () -> Void
    var backgroundColor: Color = Constant.color.tintColor
    var foregroundColor: Color = Color(.white)
    
    let content: Content
    
    init(
        action: @escaping () -> Void,
        backgroundColor: Color = Constant.color.tintColor,
        foregroundColor: Color = Color(.white),
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.action = action
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        Button(action: action){
            content
        }
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
        .cornerRadius(8)
    }
    
}

struct ButtonPrimary_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPrimary(action: {}) {
            Image(Constant.icon.heart)
            Text("Love it!")
                .font(.headline)
        }
    }
}
