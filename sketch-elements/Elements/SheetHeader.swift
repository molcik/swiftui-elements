//
//  SheetHeader.swift
//  sketch-elements
//
//  Created by Filip Krayem on 20.07.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI

struct SheetHeader: View {
    

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: Constant.icon.chevronDown)
                    .padding(.horizontal).onTapGesture {
                      
                    }
                Spacer()
                Text("Filters")
                    .bold()
                Spacer()
                Button(action: {
                  
                }) {
                    Text("Save")
                        .bold()
                }
                .padding(.horizontal)
            }
            .zIndex(2)
            .foregroundColor(Constant.color.photographyPrimary)
            Divider().padding(.vertical)
    }
}

struct SheetHeader_Previews: PreviewProvider {
    static var previews: some View {
        SheetHeader()
    }
}
