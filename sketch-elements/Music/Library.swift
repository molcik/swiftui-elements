//
//  LibraryList.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 27/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI

struct Library: View {
    
    var playlists: [Playlist]
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                //ForEach(playlists) {album in
                ForEach(0..<playlists.count / 2 + 1) { index in
                    
                    let i1 = index * 2
                    let i2 = index * 2 + 1
                    let count = playlists.count
                    
                    HStack(spacing: -8){
                        if (i1 < count) {
                            AlbumTile(album: playlists[i1], height: 180)
                        }
                        
                        if (i2 < count) {
                            AlbumTile(album: playlists[i2], height: 180)
                        }
                        //AlbumTile(album: album, height: 150)
                        //AlbumTile(album: album, height: 150)
                    }
                }
            }
            .background(Constant.color.gray)
            .navigationBarColor(Constant.color.musicPrimary.uiColor())
            .navigationBarTitle(Text("Library"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: Constant.icon.magnifyingGlass).foregroundColor(.white))
        }
    }
}

struct AlbumTile: View {
    
    var album: Playlist
    var height: CGFloat
    
    
    var body: some View {
        NavigationLink(
            destination: LibraryDetail(playlists: playlistData, songs: brotherData)
        ){
            CardAlbum(name: album.name, artist: album.artist, height: height, pictureUrl: album.picture.uri)
        }
        
        

    }
}


struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library(playlists: playlistData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
