//
//  SongTableRow.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 05/02/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI

struct SongTableRow: View {
    var left: AnyView
    var divider: Bool
    var content: String
    var description: String?
    var right: String
    var action: () -> Void

    var body: some View {
        VStack {
            TableRow(
                left: left,
                divider: divider,
                top: AnyView(Text(content)),
                bottom: description != nil ?
                    AnyView(Text(description ?? "")
                        .font(.footnote)
                        .foregroundColor(Color.gray)) :
                    AnyView(EmptyView()),

                right: AnyView(
                    HStack(alignment: .center) {
                        Image(systemName: right)
                            .foregroundColor(Constant.color.musicPrimary)
                    })
            )
        }
        .background(Color.white)
        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
        .onTapGesture(perform: action)
    }
}

struct SongTableRow_Previews: PreviewProvider {
    static var previews: some View {
        SongTableRow(
            left: AnyView(Text("left").foregroundColor(Color.gray)),
            divider: true,
            content: "content",
            description: "description",
            right: Constant.icon.dots,
            action: {}
        )
    }
}
