//
//  CardSocial.swift
//  sketch-elements
//
//  Created by Filip Molcik on 12/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct CardSocial: View {
    
    var user: User
    var contentText: String
    var timestamp: Double
    var contentImage: Picture?
    var commentPictures: [Picture?]?
    
    var body: some View {
        Card{
            VStack(){
                HStack() {
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
                    Text("\(Date(timeIntervalSinceNow: TimeInterval(timestamp - Date().timeIntervalSince1970)).timeAgoDisplay())")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .opacity(0.6)
                }
                
                HStack(){
                    if(contentImage != nil) {
                        URLImage(contentImage!.uri, content: {
                        $0.image
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        }).padding(.horizontal, -20)
                    } else {
                        Text(contentText)
                        Spacer()
                    }
                }
                

                
                HStack() {
                    if (commentPictures != nil) {
                        ForEach(commentPictures![..<(min(commentPictures!.count,3))], id: \.self) { commentPicture in
                            ZStack() {
                                Circle()
                                    .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Constant.color.bgDefault)
                                Profile(size: 26, image: commentPicture!.uri)
                            }.padding(.leading, commentPicture == commentPictures![0] ? 0 : -23.0)
                        }
                        Text("\(commentPictures!.count) comments")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .opacity(0.6)
                        Spacer()
                        Image(systemName: Constant.icon.heart)
                            .font(.title)
                            .foregroundColor(Constant.color.socialPrimary)
                    }
                }
                
            }
            .padding(.all)
            .frame(maxWidth: .infinity)
        }
    }
}

struct CardSocial_Previews: PreviewProvider {
    static var previews: some View {
        CardSocial(
            user: usersData[0],
            contentText: usersData[0].caption,
            timestamp: postsData[0].timestamp,
            contentImage: postsData[0].picture,
            commentPictures: postsData[0].comments.map({ (comment: String) -> Picture in
                return usersData.first { (user: User) -> Bool in
                    return user.id == comment
                }!.picture
            })
        )
        .environmentObject(UserData())
    }
}


struct CardMessages_Previews: PreviewProvider {
    static var previews: some View {
        CardSocial(
            user: usersData[0],
            contentText: conversationsData[2].messages[0].message,
            timestamp: conversationsData[0].messages[0].timestamp
        )
        .environmentObject(UserData())
    }
}

