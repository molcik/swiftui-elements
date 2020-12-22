//
//  Travel.swift
//  sketch-elements
//
//  Created by Filip Molcik on 13/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Travel: View {
    
    var guides:[Guide] = guidesData
    var cities:[City] = citiesData
    
    var body: some View {
        TabView() {
            Guides(guides: guides).tabItem {
                Text("Guides")
                Image(systemName: Constant.icon.doc)
            }
            Cities(cities: cities).tabItem {
                Text("Cities")
                Image(systemName: Constant.icon.map)
            }
        }
        .tabBarOpaque()
        .accentColor(Constant.color.travelPrimary)
    }
}

struct Travel_Previews: PreviewProvider {
    static var previews: some View {
        Travel().environmentObject(UserData())
    }
}


