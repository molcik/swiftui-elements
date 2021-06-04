//
//  CardPictureModalPlayer.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct CardPictureModalPlayer: View {
    
    var height: CGFloat
    var pictureOneUrl: URL
    let largeConfig = UIImage.SymbolConfiguration(scale: .medium)
    var albums: [Playlist]

    
    var body: some View {
        Card{
            VStack(spacing: 0){
                Spacer()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(width: height, height: height )
                    .foregroundColor(Color.white)       .background(
                        URLImage(pictureOneUrl, content:  {
                            $0.image
                                .renderingMode(.original)
                                .resizable()
                        })
                    )
                
            }
            .frame(width: height, height: height)
            .cornerRadius(10)
        }
        .frame(width: height, height: height)
            }
        }


struct CardPictureModalPlayer_Previews: PreviewProvider {
    static var previews: some View {
        CardPictureModalPlayer(
            height: 300.0,
            pictureOneUrl: recipesData[0].picture.uri,
            albums: playlistData
        )
            .environmentObject(UserData())
    }
}

