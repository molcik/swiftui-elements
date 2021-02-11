//
//  SongTableRow.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 05/02/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI

struct SongTableRow: View {
    
    //var left: String
    var left: AnyView
    var divider: Bool
    var content: String
    var description: String?
    var right: String

    
    var body: some View {
        TableRow(
            //left: AnyView(Text(left).foregroundColor(Color.gray)),
            left: left,
            divider: divider,
            top: AnyView(Text(content)),
            bottom: description != nil ?
                AnyView(Text(description ?? "")
                    .font(.footnote)
                    .foregroundColor(Color.gray)):
                AnyView(EmptyView()) ,
            //right: AnyView(EmptyView())
            //right: AnyView(Image(right ?? "pencil"))
            right: AnyView(
                HStack(alignment: .center){
                    Image(systemName: right)
                    //Image(Constant.icon.bed)
                    //Text("o o o") //Nevim sakra, jak tam narvat ten obrázek

            })
        )
    }
}

struct SongTableRow_Previews: PreviewProvider {
    static var previews: some View {
            SongTableRow(
                left: AnyView(Text("left").foregroundColor(Color.gray)),
                divider: true,
                content: "content",
                description: "description",
                right: "Constant.icon.dots"
            )
    }
}
