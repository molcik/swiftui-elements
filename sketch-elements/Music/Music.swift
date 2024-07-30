//
//  Music.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 28/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Music: View {
    var albums: [Album] = musicData
    var cities: [City] = citiesData
    @EnvironmentObject var modalManager: ModalManager
    var body: some View {
        TabView {
            ZStack {
                VStack {
                    Library(albums: albums)
                    Spacer()
                    MiniPlayer()
                }
            }
            .tabItem {
                Text("Library")
                Image(systemName: Constant.icon.note)
            }
            ZStack {
                VStack {
                    Discovery(albums: albums)
                    Spacer()
                    MiniPlayer()
                }
            }.tabItem {
                Text("Discovery")
                Image(systemName: Constant.icon.doc)
            }
            ZStack {
                VStack {
                    MusicAccount(user: usersData[9])
                    Spacer()
                    MiniPlayer()
                }
            }
            .tabItem {
                Text("Account")
                Image(systemName: Constant.icon.person)
            }
        }
        .tabBarOpaque()
        .accentColor(Constant.color.musicPrimary)
    }
}

struct Music_Previews: PreviewProvider {
    static var previews: some View {
        Music().environmentObject(UserData())
            .environmentObject(MusicViewModel())
//        Music().environmentObject(UserData())
//            .environmentObject(MusicViewModel())
//            .previewDevice("iPhone 8")
    }
}
