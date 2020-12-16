//
//  Messages.swift
//  sketch-elements
//
//  Created by Filip Molcik on 13/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Messages: View {
    
    var conversations: [Conversation]
    var users: [User]
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(conversations) { conversation in
                        //NavigationLink(
                        //    destination: RecipesListView(category: category)
                        //) {
                        CardSocial(
                            user: users.first(where: { $0.id == conversation.user })!,
                            contentText: conversation.messages[0].message,
                            timestamp: conversation.messages[0].timestamp
                        )
                    }
                }
            }.background(Constant.color.gray)
            .navigationBarColor(Constant.color.socialPrimary.uiColor())
            .navigationBarTitle(Text("Messages"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: Constant.icon.compose).foregroundColor(.white))
        }
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages(conversations: conversationsData, users: usersData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}

