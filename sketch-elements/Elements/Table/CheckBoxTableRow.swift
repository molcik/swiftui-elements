//
//  CheckBoxTableRow.swift
//  sketch-elements
//
//  Created by Filip Molcik on 28/04/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct CheckBoxTableRow: View {
    
    var divider: Bool
    var content: String
    var description: String?
    var tintColor: Color = Constant.color.tintColor
    @State var checked: Bool
    
    var body: some View {
        TableRow(
            left: AnyView(
                HStack(alignment: .center){
                    Circle()
                        .fill(tintColor)
                        .opacity(checked ? 1 : 0)
                        .overlay(
                            Circle()
                                .stroke(tintColor, lineWidth: 2)
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
        )
            .opacity(checked ? 0.5 : 1)
            .onTapGesture {
                self.checked.toggle()
        }
        
    }
}

struct CheckBoxTableRow_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxTableRow(
            divider: true,
            content: "content",
            description: "description",
            checked: true
        )
    }
}
