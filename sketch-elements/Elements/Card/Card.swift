//
//  RecipeRow.swift
//  sketch-elements
//
//  Created by Filip Molcik on 29/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct Card<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
        .frame(maxWidth: .infinity)
            .background(Constant.color.bgDefault)
        .cornerRadius(8)
        .shadow(radius: 8)
        .padding([.top, .leading, .trailing])
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card{
            VStack() {
                Text("Content")
            }.frame(
                maxWidth: .infinity
            )
            .padding()
        }
    }
}

