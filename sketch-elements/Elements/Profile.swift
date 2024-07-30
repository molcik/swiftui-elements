//
//  Profile.swift
//  sketch-elements
//
//  Created by Filip Molcik on 12/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct Profile: View {
    var size: CGFloat = 50.0
    var image: URL?
    var disabled: Bool = false
    var notification: Bool = false
    var add: Bool = false
    
    var body: some View {
        ZStack {
            if add {
                ZStack {
                    Image(systemName: Constant.icon.plus)
                        .resizable()
                        .foregroundColor(Constant.color.socialPrimary)
                        .frame(width: size/2, height: size/2)
                }
                .frame(width: size, height: size)
                .background(Constant.color.socialPrimary.opacity(0.15))
                .clipShape(Circle())
                    
            } else {
                WebImage(url: image!)
                    .resizable()
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            }
                
            if disabled {
                Circle()
                    .frame(width: size, height: size)
                    .foregroundColor(disabled ? Constant.color.bgDefault.opacity(0.7) : Color.black.opacity(0))
            }
                
            if notification {
                Circle()
                    .frame(width: size/4, height: size/4)
                    .foregroundColor(Constant.color.bgDefault)
                    .position(x: size/2 + cos(45 * .pi/180) * size/2, y: size/2 - sin(45 * .pi/180) * size/2)
                    
                Circle()
                    .frame(width: size/6, height: size/6)
                    .foregroundColor(Constant.color.socialPrimary)
                    .position(x: size/2 + cos(45 * .pi/180) * size/2, y: size/2 - sin(45 * .pi/180) * size/2)
            }
        }
        .frame(width: size, height: size)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(
            image: usersData[1].picture.uri,
            disabled: true,
            notification: true,
            add: false
        ).environmentObject(UserData())
    }
}
