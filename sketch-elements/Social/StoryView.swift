//
//  StoryView.swift
//  sketch-elements
//
//  Created by Filip Krayem on 29.07.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct StoryView: View {
    var story: Story
    var user: User
    init(story: Story) {
        self.story = story
        self.user = usersData.first(where: { $0.id == story.user })!
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Profile(size: 40, image: user.picture.uri)
                VStack(alignment: .leading) {
                    Text("\(user.name)")
                        .fontWeight(.bold)
                    Text("@\(user.id)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .opacity(0.6)
                }
                Spacer()
            }
            .padding(.top, 50)
            .padding(.leading, 30)
            .foregroundColor(.white)
            Spacer()
        }.background(URLImage(story.picture.uri) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        }).edgesIgnoringSafeArea(.all)
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: storiesData[1])
    }
}
