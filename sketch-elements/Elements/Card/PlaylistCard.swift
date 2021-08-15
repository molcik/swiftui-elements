//
//  CardMusic.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 26/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct PlaylistCard: View {
    var playlist: Playlist

    init(_ playlist: Playlist) {
        self.playlist = playlist
    }

    let height: CGFloat = 400

    var body: some View {
        Card {
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        ForEach(playlist.Albums[0 ... 1], id: \.id) { album in
                            Spacer()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .frame(height: height/2)
                                .foregroundColor(Color.white).background(
                                    WebImage(url: album.picture.uri)
                                        .renderingMode(.original)
                                        .resizable()
                                        .indicator(.activity)
                                )
                        }
                    }
                    HStack {
                        ForEach(playlist.Albums[2 ... 3], id: \.id) { album in
                            Spacer()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .frame(height: height/2)
                                .foregroundColor(Color.white).background(
                                    WebImage(url: album.picture.uri)
                                        .renderingMode(.original)
                                        .resizable()
                                        .indicator(.activity)
                                )
                        }
                    }
                }
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(playlist.title)
                                .fontWeight(.bold)
                                .font(.title)
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text(playlist.description)
                        Spacer()
                        ZStack {
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 50, height: 50)
                                .opacity(0.6)
                            Image(systemName: Constant.icon.play)
                                .scaleEffect(CGSize(width: 1.4, height: 1.4))
                        }
                    }
                }

                .padding(.all)
                .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0), Color.black.opacity(0), Color.black.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .foregroundColor(Color.white)
            }
        }
    }
}

struct CardPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistCard(Playlist(id: "playlist-1", title: "Little Victories", description: "", Albums: Array(musicData[0 ... 8])))
            .environmentObject(UserData())
    }
}
