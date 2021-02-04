//
//  CardAlbum.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 27/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct CardAlbum: View {
    
    var name: String
    var artist: String
    var height: CGFloat
    var pictureUrl: URL


    
    var body: some View {
        Card{
            VStack(){
                Spacer()
                .padding(.all)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .foregroundColor(Color.white)
                .background(
                    URLImage(pictureUrl, content:  {
                        $0.image
                            .renderingMode(.original)
                            .resizable()
                    })
                )
                VStack(alignment: .leading){
                    HStack(){
                        VStack(alignment: .leading){
                            Text(name)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.headline)
                                .padding(.horizontal)
                                .frame(height: height/5)
                            Text(artist)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .opacity(0.6)
                                .padding(.horizontal)
                                .padding(.bottom)
                                .frame(height: height/5)
                            //Spacer()
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
        CardAlbum(name: playlistData[0].name, artist: playlistData[0].artist, height: 200, pictureUrl: playlistData[0].picture.uri).environmentObject(UserData())
        
    }
}
