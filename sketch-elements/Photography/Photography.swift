//
//  Photography.swift
//  sketch-elements
//
//  Created by Filip Krayem on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Photography: View {
    var photos: [Photo] = photographyData

    var body: some View {
        TabView {
            Photos(photos: photos).tabItem {
                Text("Photos")
                Image(systemName: Constant.icon.rectangles)
            }
            Albums().tabItem {
                Text("Albums")
                Image(systemName: Constant.icon.rectangleStack)
            }
            Places().tabItem {
                Text("Places")
                Image(systemName: Constant.icon.map)
            }
        }
        .tabBarOpaque()
        .accentColor(Constant.color.photographyPrimary)
    }
}

struct PhotographyView_Previews: PreviewProvider {
    static var previews: some View {
        Photography().environmentObject(UserData())
    }
}
