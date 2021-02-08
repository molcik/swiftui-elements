//
//  MusicHeader.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 05/02/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct MusicHeader: View {
    
    var image: URL
    var height: CGFloat
    @State var selection: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top){
                //Image(systemName: "play")
                URLImage(image, content:  {
                    $0.image
                        .renderingMode(.original)
                        .resizable()
                })
                    .frame(width: 70, height: 70)
                    .cornerRadius(4)
                /*Spacer()
                    .background((
                        URLImage(image, content:  {
                            $0.image
                                .renderingMode(.original)
                                .resizable()
                        })
                    ))*/
                VStack(alignment: .leading){
                    Text("Nazev")
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .font(.headline)
                    Text("Podnazev")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                .padding(.all)
            }
            Divider()
                .frame(maxWidth: .infinity)
                //.padding(.bottom)
            HStack(spacing: -8){
                //NavigationLink(destination: nil) {
                    ButtonPrimary(
                        action: {self.selection = 1},
                        backgroundColor: Constant.color.musicButtonColor,
                        foregroundColor: Constant.color.musicPrimary
                    ) {
                        Image(systemName: Constant.icon.play)
                            //.accentColor(Constant.color.musicPrimary)
                    }
                    .padding([.leading, .trailing])
                //}
                //NavigationLink(destination: nil) {
                    ButtonPrimary(
                        action: {self.selection = 2},
                        backgroundColor: Constant.color.musicButtonColor,
                        foregroundColor: Constant.color.musicPrimary
                    ) {
                        Image(systemName:Constant.icon.shuffle)
                            
                    }
                    .padding([.leading, .trailing])
                //}
                
            }
            .padding(.top)
            //Spacer()
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .padding(.bottom)
        .padding(.horizontal)
        .foregroundColor(.white)
        .background(Constant.color.bgDefault)
    }
}

struct MusicHeader_Previews: PreviewProvider {
    static var previews: some View {
        MusicHeader(image: playlistData[2].picture.uri, height: 150)
            .environment(\.colorScheme, .light)
        //LibraryDetail(playlists: playlistData, songs: brotherData)
            
    }
}
