//
//  Guides.swift
//  sketch-elements
//
//  Created by Filip Molcik on 13/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Guides: View {
    
    var guides: [Guide]
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                // We need to iterate over every 3 items to display them in grid
                ForEach(0..<guides.count / 3 + 1) { index in
                
                    let i1 = index * 3
                    let i2 = index * 3 + 1
                    let i3 = index * 3 + 2
                    let count = guides.count
                    
                    // Row 2x1
                    HStack(spacing: -8) {
                        if (i1 < count) {
                            GuideTile(guide: guides[i1], height: 150)
                        }
                        
                        if (i2 < count) {
                            GuideTile(guide: guides[i2], height: 150)
                        }
                    }
                    
                    // Row 1x1
                    if (i3 < count) {
                        GuideTile(guide: guides[i3], height: 300)
                    }
                    
                }
            }
            .background(Constant.color.gray)
            .navigationBarColor(Constant.color.travelPrimary.uiColor())
            .navigationBarTitle(Text("Guides"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: Constant.icon.magnifyingGlass).foregroundColor(.white))
        }
    }
}

struct GuideTile: View {
    
    var guide: Guide
    var height: CGFloat
    
    var body: some View {
        NavigationLink(
            destination: GuideDetail(guide: guide)
        ) {
                CardWithBackground(title: guide.city, subTitle: guide.country, height: height, pictureUrl: guide.picture.uri, description: "\(guide.duration) days")
            }

    }
}


struct Guides_Previews: PreviewProvider {
    static var previews: some View {
        Guides(guides: guidesData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
