//
//  CardAlbum.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 27/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct AlbumCard: View {
    var album: Album

    let height: CGFloat = 150

    var body: some View {
        Card {
            VStack {
                Spacer()
                    .padding(.all)
                    .frame(maxWidth: .infinity)
                    .frame(height: height)
                    .foregroundColor(Color.white)
                    .background(
                        WebImage(url: album.picture.uri)
                            .renderingMode(.original)
                            .resizable()
                            .indicator(.activity)
                    )
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(album.name)
                                .fontWeight(.bold)
                                .font(.headline)
                                .padding(.horizontal)
                                .frame(height: height / 5)
                            Text(album.artist)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .opacity(0.6)
                                .padding(.horizontal)
                                .padding(.bottom)
                                .frame(height: height / 5)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct CardAlbum_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCard(album: musicData[0])
    }
}
