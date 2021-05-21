//
//  PlayerButton.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 21.05.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonPlayer<Content: View>: View {
    
    var action: () -> Void
    var backgroundColor: Color = Constant.color.tintColor
    var foregroundColor: Color = Color(.white)
    
    let content: Content
    
    init(
        action: @escaping () -> Void,
        //backgroundColor: Color = Constant.color.tintColor,
        foregroundColor: Color = Color(.white),
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.action = action
        //self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        Button(action: action){
            content
        }
        .frame(minWidth: 44, maxWidth: 56, minHeight: 44)
        //.background(backgroundColor)
        .foregroundColor(foregroundColor)
        .cornerRadius(8)
    }
    
}

struct ButtonPlayer_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlayer(action: {}) {
            Image(Constant.icon.heart)
            Text("Love it!")
                .font(.headline)
        }
    }
}
