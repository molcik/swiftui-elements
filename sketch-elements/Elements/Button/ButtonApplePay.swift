//
//  ApplePayButton.swift
//  sketch-elements
//
//  Created by Filip Molcik on 30/06/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import UIKit
import PassKit

struct ButtonApplePay: UIViewRepresentable {


    func makeUIView(context: Context) -> PKPaymentButton {
        return PKPaymentButton()
    }

    func updateUIView(_ uiView: PKPaymentButton,
        context: UIViewRepresentableContext<ButtonApplePay>) {
    }
}
