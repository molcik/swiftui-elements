//
//  TextTableRow.swift
//  sketch-elements
//
//  Created by Filip Molcik on 28/04/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct TextTableRow: View {
    
    var left: String
    var divider: Bool
    var content: String
    var description: String?
    
    var body: some View {
        TableRow(
            left: AnyView(Text(left).foregroundColor(Color.gray)),
            divider: divider,
            top: AnyView(Text(content)),
            bottom: description != nil ?
                AnyView(Text(description ?? "")
                    .font(.footnote)
                    .foregroundColor(Color.gray)):
                AnyView(EmptyView()) ,
            right: AnyView(EmptyView())
        )
    }
}

struct TextTableRow_Previews: PreviewProvider {
    static var previews: some View {
            TextTableRow(
                left: "left",
                divider: true,
                content: "content",
                description: "description"
            )
    }
}
