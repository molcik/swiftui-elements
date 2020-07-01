//
//  TabBar.swift
//  sketch-elements
//
//  Created by Filip Molcik on 30/06/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    
    var content: [TabItem]
    
    init(_ content: [TabItem]) {
        self.content = content
    }
    
    var body: some View {
        HStack () {
            ForEach(content) {tab in
                Spacer()
                VStack() {
                    if (tab.customView != nil) {
                        tab.customView
                    } else {
                        Image(systemName: tab.icon ?? "circle")
                    }
                    Text(tab.name)
                        .font(.caption)
                }
                .frame(maxWidth:.infinity)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 64.0)
        .background(Color("Default"))
        .foregroundColor(Color("BrandPrimary"))
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar([
            TabItem(name: "$$", icon: "creditcard"),
            TabItem(name: "129 reviews", customView: Stars(3).eraseToAnyView()),
            TabItem(name: "$18:00 - 22:00", icon: "clock.fill")
        ])        
    }
}
