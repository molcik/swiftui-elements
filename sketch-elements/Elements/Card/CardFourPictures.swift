//
//  CardFourPictures.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 11/02/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct CardFourPicture: View {
    
    var height: CGFloat
    var pictureOneUrl: URL
    var pictureTwoUrl: URL
    var pictureThreeUrl: URL
    var pictureFourUrl: URL
    let largeConfig = UIImage.SymbolConfiguration(scale: .medium)
    var albums: [Playlist]

    
    var body: some View {
        Card{
            VStack(spacing: 0){
                HStack(){
                    Spacer()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .frame(width: height/2, height: height/2 )
                        .foregroundColor(Color.white)       .background(
                            URLImage(pictureOneUrl, content:  {
                                $0.image
                                    .renderingMode(.original)
                                    .resizable()
                            })
                        )
                    Spacer()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .frame(width: height/2, height: height/2 )
                        .foregroundColor(Color.white)       .background(
                            URLImage(pictureTwoUrl, content:  {
                                $0.image
                                    .renderingMode(.original)
                                    .resizable()
                            })
                        )
                }
                HStack(){
                    Spacer()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .frame(width: height/2, height: height/2 )
                        .foregroundColor(Color.white)       .background(
                            URLImage(pictureThreeUrl, content:  {
                                $0.image
                                    .renderingMode(.original)
                                    .resizable()
                            })
                        )
                    Spacer()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .frame(width: height/2, height: height/2 )
                        .foregroundColor(Color.white)       .background(
                            URLImage(pictureFourUrl, content:  {
                                $0.image
                                    .renderingMode(.original)
                                    .resizable()
                            })
                        )
                }
            }
            .frame(width: height, height: height)
            .cornerRadius(4)
        }
        .frame(width: height, height: height)
            }
        }


struct CardFourPicture_Previews: PreviewProvider {
    static var previews: some View {
        CardFourPicture(
            height: 300.0,
            pictureOneUrl: recipesData[0].picture.uri,
            pictureTwoUrl: recipesData[1].picture.uri,
            pictureThreeUrl: recipesData[2].picture.uri,
            pictureFourUrl: recipesData[3].picture.uri,
            albums: playlistData
        )
            .environmentObject(UserData())
    }
}

