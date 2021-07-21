//
//  NewPost.swift
//  sketch-elements
//
//  Created by Filip Krayem on 20.07.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI

struct NewPost: View {
    @EnvironmentObject var modalManager: ModalManager
    @State private var fullText: String = ""
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    Image(systemName: Constant.icon.chevronDown)
                        .padding(.horizontal).onTapGesture {
                            modalManager.closeModal()
                        }
                    Spacer()
                    Text("New Post")
                        .bold()
                    Spacer()
                    Button(action: {
                        modalManager.closeModal()
                    }) {
                        Text("Post")
                            .bold()
                    }
                    .padding(.horizontal)
                }
                .zIndex(2)
                .foregroundColor(Constant.color.socialPrimary)
                .padding()
                Divider()
            }
            TextEditor(text: $fullText).padding()
            
        }
    }
}

struct NewPost_Previews: PreviewProvider {
    static var previews: some View {
        NewPost()
    }
}
