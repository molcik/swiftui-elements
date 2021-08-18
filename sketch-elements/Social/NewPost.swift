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
    @State var fullText: String = ""
    @State var selection: Int = 0

   
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center) {
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
            SegmentedPickerCollapsed(items: ["Text", "Photo"], selection: $selection, backgroundColor: Constant.color.socialPrimary.opacity(0.5), activeColor: Constant.color.socialPrimary.opacity(0.8), textColor: Color.white)
                .padding()
            TextView() {
                $0.backgroundColor = Constant.color.bgDefault.uiColor()
                $0.endEditing(modalManager.modal.position == .closed)
            }
                .padding()
        }
    }
}

struct TextView: UIViewRepresentable {
    typealias UIViewType = UITextView
    var configuration = { (_: UIViewType) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIViewType {
        UIViewType()
    }

    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Self>) {
        configuration(uiView)
    }
}

struct NewPost_Previews: PreviewProvider {
    static var previews: some View {
        NewPost()
            .colorScheme(.dark)
    }
}
