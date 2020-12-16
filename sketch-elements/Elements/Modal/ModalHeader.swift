//
//  ModalHeader.swift
//  sketch-elements
//
//  Created by Filip Molcik on 24/04/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct ModalHeader: View {
    
    var action: () -> Void
    var title: String?
    var attachment: AnyView?
    var tintColor: Color = Constant.color.tintColor

    var body: some View {
       
        VStack(alignment: .center){
            HStack(alignment: .center){
                  Button(action: action) {
                    Image(systemName: Constant.icon.chevronDown)
                          .font(.system(size: 24.0, weight: .medium))
                  }
                Spacer()
                Text(title ?? "")
                    .font(.headline)
                Spacer()
                attachment
              }
            .padding([.top, .horizontal])
            Divider()
        }
        .foregroundColor(tintColor)
    }
}

struct ModalHeader_Previews: PreviewProvider {
    static var previews: some View {
        ModalHeader(action: {}, title: "Title", attachment: AnyView(Button(action: {}){Text("button")} ))
    }
}
