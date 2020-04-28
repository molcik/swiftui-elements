//
//  CheckBoxTableRow.swift
//  sketch-elements
//
//  Created by Filip Molcik on 28/04/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct CheckBoxTableRow: View {
    
    @Binding var checked: Bool
    var divider: Bool
    var content: String
    var description: String?
    
    var body: some View {
        TableRow(
            left: AnyView(
                HStack(alignment: .center){
                    Circle()
                        .fill(Color("BrandPrimary"))
                        .opacity(checked ? 1 : 0)
                    .overlay(
                        Circle()
                            .stroke(Color("BrandPrimary"), lineWidth: 2)
                            .opacity(checked ? 0 : 1)
                    )
                    .frame(width: 24, height: 24)
                }
            ),
            divider: divider,
            top: AnyView(Text(content)),
            bottom: description != nil ?
                AnyView(Text(description ?? "").foregroundColor(Color.gray)):
                AnyView(EmptyView()) ,
            right: AnyView(EmptyView())
        ).opacity(checked ? 0.5 : 1)
    }
}

struct CheckBoxTableRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            CheckBoxTableRow(
                checked: Binding.constant(false),
                divider: true,
                content: "content",
                description: "description"
            )
        }
    }
}
