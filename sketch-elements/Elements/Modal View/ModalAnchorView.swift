//
//  ModalView.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct ModalAnchorView: View {
    
    @Binding var currentModal: Modal
    
    var body: some View {
        ModalView(modal: $currentModal)
    }
}
