//
//  TabBar.swift
//  sketch-elements
//
//  Created by Filip Molcik on 30/06/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    
    var backgroundColor: Color = Constant.color.bgDefault
    var foregroundColor: Color = Constant.color.tintColor
    var content: [TabItem]
    
    var body: some View {
        HStack () {
            ForEach(content) {tab in
                Spacer()
                VStack() {
                    if (tab.customView != nil) {
                        tab.customView
                    } else {
                        Image(systemName: tab.icon ?? Constant.icon.circle)
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
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(content: [
            TabItem(name: "$$", icon: "creditcard"),
            TabItem(name: "129 reviews", customView: Stars(3).eraseToAnyView()),
            TabItem(name: "$18:00 - 22:00", icon: "clock.fill")
        ])        
    }
}
