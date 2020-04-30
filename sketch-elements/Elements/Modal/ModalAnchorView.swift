//
//  ModalView.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct ModalAnchorView: View {
    
    @EnvironmentObject var modalManager: ModalManager
    
    var body: some View {
        ModalView(modal: $modalManager.modal)
    }
}
