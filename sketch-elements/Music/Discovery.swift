////
////  Discovery.swift
////  sketch-elements
////
////  Created by Oliver Jansta on 30/01/2021.
////  Copyright © 2021 Filip Molcik. All rights reserved.
////
//
//import Foundation
//import SwiftUI
//
//struct Discovery: View {
//    
//    var playlists: [Playlist]
//    
//    var body: some View {
//        
//        NavigationView {
//            ScrollView(.vertical, showsIndicators: false) {
//                
//                NavigationLink(
//                    destination: DiscoveryDetail(playlists: playlistData, songs: brotherData)
//                ){
//                CardPlaylist(title: "Little Victories", height: 400, pictureUrl: playlists[0].picture.uri, description: "Jedna deska, Dve desky", albums: playlists)
//                }
//                NavigationLink(
//                    destination: DiscoveryDetail(playlists: playlistData, songs: brotherData)
//                ){
//                CardPlaylist(title: "Today's Hits", height: 400, pictureUrl: playlists[1].picture.uri, description: "Lords, Shakira, Lady Gaga", albums: playlists)
//                }
//                
//                /*
//                //ForEach(playlists) {album in
//                ForEach(0..<playlists.count / 2 + 1) { index in
//                    
//                    let i1 = index * 2
//                    let i2 = index * 2 + 1
//                    let count = playlists.count
//                    
//                    HStack(spacing: -8){
//                        if (i1 < count) {
//                            AlbumTile(album: playlists[i1], height: 180)
//                        }
//                        
//                        if (i2 < count) {
//                            AlbumTile(album: playlists[i2], height: 180)
//                        }
//                        //AlbumTile(album: album, height: 150)
//                        //AlbumTile(album: album, height: 150)
//                    }
//                } */
//            }
//            .background(Constant.color.gray)
//            .navigationBarColor(Constant.color.musicPrimary.uiColor())
//            .navigationBarTitle(Text("Discovery"), displayMode: .large)
//            .navigationBarItems(trailing: Image(systemName: Constant.icon.magnifyingGlass).foregroundColor(.white))
//        }
//    }
//}
//
//struct DiscoveryTile: View {
//    
//    var playlists: Playlist
//    var height: CGFloat
//    
//    
//    var body: some View {
//        CardAlbum(name: playlists.name, artist: playlists.artist, height: height, pictureUrl: playlists.picture.uri)
//
//    }
//}
//
//
//struct Discovery_Previews: PreviewProvider {
//    static var previews: some View {
//        Discovery(playlists: playlistData)
//            .environmentObject(UserData())
//            .environment(\.colorScheme, .light)
//    }
//}
