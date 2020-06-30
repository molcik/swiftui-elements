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
                    Image(systemName: tab.icon)
                    Text(tab.name)
                        .font(.caption)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 64.0)
        .background(Color("Default"))
        .foregroundColor(Color("BrandPrimary"))
    }
}

