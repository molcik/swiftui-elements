//
//  TableRow.swift
//  sketch-elements
//
//  Created by Filip Molcik on 28/04/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct TableRow: View {
    
    var left: AnyView
    var divider: Bool
    var top: AnyView
    var bottom: AnyView
    var right: AnyView
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                left.padding(.leading)
                VStack(alignment: .leading){
                     top.padding(.horizontal)
                     bottom.padding(.horizontal)
                 }
                 Spacer()
                right.padding(.horizontal)
            }
            divider ? Divider() : nil
        }
    }
}

struct TableRow_Previews: PreviewProvider {
    static var previews: some View {
            TableRow(
                left: AnyView(Text("left")),
                divider: true,
                top: AnyView(Text("top")),
                bottom: AnyView(Text("bottom")),
                right: AnyView(Text("right"))
            )
    }
}
