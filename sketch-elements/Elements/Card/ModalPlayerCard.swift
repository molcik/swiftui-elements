//
//  CardPictureModalPlayer.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct ModalPlayerCard: View {
    var height: CGFloat = 300
    let largeConfig = UIImage.SymbolConfiguration(scale: .medium)
    var image: URL

    var body: some View {
        Card {
            VStack(spacing: 0) {
                Spacer()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(width: height, height: height)
                    .foregroundColor(Color.white).background(
                        WebImage(url: image)
                            .renderingMode(.original)
                            .resizable()
                            .indicator(.activity)
                    )
            }
            .frame(width: height, height: height)
            .cornerRadius(10)
        }
        .frame(width: height, height: height)
    }
}

struct ModalPlayerCard_Previews: PreviewProvider {
    static var previews: some View {
        ModalPlayerCard(
            image: musicData[0].picture.uri
        )
        .environmentObject(UserData())
    }
}
