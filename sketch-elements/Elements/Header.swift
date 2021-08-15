//
//  Header.swift
//  sketch-elements
//
//  Created by Filip Molcik on 08/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct Header<Content: View>: View {
    var image: URL
    var height: CGFloat
    let content: Content

    init(image: URL, height: CGFloat, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.image = image
        self.height = height
    }

    var body: some View {
        content
            .padding(.top)
            .padding(.all)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom))
            .background(
                WebImage(url: image)
                    .renderingMode(.original)
                    .resizable(capInsets: .init(), resizingMode: .tile)
                    .indicator(.activity)
            )
            .frame(maxWidth: .infinity)
            .frame(height: height)
    }
}
