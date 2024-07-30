//
//  Message.swift
//  sketch-elements
//
//  Created by Filip Krayem on 26.07.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI
struct Chat: View {
    var conversation: Conversation
    let users = usersData
    var body: some View {
        NavigationView {
            GeometryReader { g in
                ZStack(alignment: .top) {
                    Color.black.opacity(0.04).edgesIgnoringSafeArea(.all)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            ForEach(conversation.messages) { message in
                                HStack {
                                    if !message.me {
                                        let user = users.first(where: { $0.id == conversation.user })!
                                        WebImage(url: user.picture.uri)
                                            .resizable()
                                            .indicator(.activity)
                                            .scaledToFit()
                                            .frame(width: g.size.width * 0.2, height: 50)
                                            .clipShape(Circle())
                                    }
                                    ZStack {
                                        Rectangle()
                                            .frame(width: g.size.width * 0.7, height: 75)
                                            .foregroundColor(Constant.color.bgDefault)
                                            .cornerRadius(12, antialiased: true)
                                            .shadow(color: .black.opacity(0.06), radius: 1, x: 0, y: 5)
                                            .padding(.leading, message.me ? 30 : 0)
                                        Text(message.message).frame(maxWidth: g.size.width * 0.6, maxHeight: 75, alignment: .leading)
                                            .padding(.leading, message.me ? 30 : 0)
                                    }

                                    if message.me {
                                        let user = users.first(where: { $0.id == usersData[6].id })!
                                        WebImage(url: user.picture.uri)
                                            .resizable()
                                            .indicator(.activity)
                                            .scaledToFit()
                                            .frame(width: g.size.width * 0.2, height: 50)
                                            .clipShape(Circle())
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.top, -75)
        .navigationBarColor(Constant.color.socialPrimary.uiColor())
        .navigationBarTitle(Text("Sofia Griffin"), displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: Constant.icon.compose).foregroundColor(.white))
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat(conversation: conversationsData[1]).colorScheme(.dark)
    }
}
