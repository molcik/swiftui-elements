//
//  DiscoveryDetail.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 08/02/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct DiscoveryDetail: View {
    
    var playlists: [Playlist]
    var songs: [Album]
    var musicColor = Constant.color.musicPrimary
    var navigationBarDisplayMode = NavigationBarItem.TitleDisplayMode.inline
    @State var vypinac = true
    
    
    
    var body: some View {
        return VStack(spacing: 10){
            MusicHeader(image: playlists[0].picture.uri, height: 170)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(0..<songs.count) { index in
                        SongTableRow(
                            //left: "\(index + 1)",
                            left: AnyView(URLImage(playlists[index].picture.uri, content:  {
                                $0.image
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            })
                            .frame(width: 50, height: 50)
                            .cornerRadius(4)),
                            divider: index < self.songs.count - 1,
                            content: songs[index].name,
                            description: "Nazev Alba",
                            right: Constant.icon.dots
                        )
                    }
                }.padding([.top, .bottom])
                    .frame(maxWidth: .infinity)
                    .background(Constant.color.bgDefault)
                    .cornerRadius(8)
                    .padding([.leading, .bottom, .trailing])
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .accentColor(Constant.color.musicPrimary)
        //.padding(.top)
        .background(Constant.color.gray)
        .navigationBarTitle("", displayMode: navigationBarDisplayMode)
        .navigationBarItems(trailing: Image(systemName: Constant.icon.share).foregroundColor(.white))
        .navigationBarColor(musicColor.uiColor())
        /*.onAppear {
            self.modalManager.newModal(position: .closed) {
                IngredientsModal(recipe: self.recipe, action: self.modalManager.closeModal)
            }
        } */
    }
}


struct DiscoveryDetail_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryDetail(playlists: playlistData, songs: brotherData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
