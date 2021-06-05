//
//  Albums.swift
//  sketch-elements
//
//  Created by Filip Krayem on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
struct Albums: View {
    
    let albums = groupBy(photographyData, {$0.album})
    
    var body: some View {
       

        NavigationView() {
            ScrollView(.vertical, showsIndicators: false) {                ForEach(albums.keys.sorted(), id: \.self, content: { value in
                    AlbumRow(albumName: value, numberOfPhotos: (albums[value]?.count)!, showcasedPhotos: Array((albums[value]?.prefix(3))!))
                })
            }
            .frame(maxWidth: .infinity)
            .background(Constant.color.gray)
            .navigationBarColor(Constant.color.photographyPrimary.uiColor())
            .navigationBarTitle(Text("Albums"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: Constant.icon.camera).foregroundColor(.white))
        }
    }
}

struct Albums_Previews: PreviewProvider {
    static var previews: some View {
        Albums()
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
