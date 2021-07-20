//
//  PhotoPreview.swift
//  sketch-elements
//
//  Created by Filip Krayem on 08.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct PhotoPreview: View {
    var url: URL
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        URLImage(url) {
            EmptyView()
        } inProgress: { _ in
            Rectangle()
                .border(colorScheme == .dark ? Color.init(red: 0.15, green: 0.15, blue: 0.15) : Color.white, width: 4)
                .aspectRatio(1 / 1, contentMode: .fit)
                .foregroundColor(.gray.opacity(0.3))
                .shadow(color: .black.opacity(0.075), radius: 1, x: 0, y: 1)
        } failure: { error, retry in
            // Display error and retry button
            VStack {
                Text(error.localizedDescription)
                Button("Retry", action: retry)
            }
        } content: { image in
            image
                .resizable()
                .aspectRatio(1 / 1, contentMode: .fit)
                .border(colorScheme == .dark ? Color.init(red: 0.15, green: 0.15, blue: 0.15) : Color.white, width: 4)
                .shadow(color: .black.opacity(0.075), radius: 1, x: 0, y: 1)
        }
    }
}

struct Photo_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPreview(url: photographyData[0].urls.regular)
    }
}
