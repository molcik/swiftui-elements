//
//  PhotoPreview.swift
//  sketch-elements
//
//  Created by Filip Krayem on 08.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct PhotoPreview: View {
    var url: URL
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            WebImage(url: url)
                .placeholder {
                    ZStack {
                        Rectangle()
                            .border(colorScheme == .dark ? Color(red: 0.15, green: 0.15, blue: 0.15) : Color.white, width: 4)
                            .foregroundColor(.gray.opacity(0.3))
                            .frame(width: 100, height: 100)
                            .shadow(color: .black.opacity(0.075), radius: 1, x: 0, y: 1)
                    }
                }
                .resizable()
                .indicator(.activity) // Activity Indicator
                .scaledToFill()
                .frame(width: 100, height: 100, alignment: .center)
                .clipped()
                .shadow(color: .black.opacity(0.075), radius: 1, x: 0, y: 1)
        }
        .border(colorScheme == .dark ? Color(red: 0.15, green: 0.15, blue: 0.15) : Color.white, width: 4)
    }
}

struct Photo_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPreview(url: photographyData[4].urls.regular)
    }
}
