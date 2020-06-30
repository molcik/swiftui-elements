//
//  TabItem.swift
//  sketch-elements
//
//  Created by Filip Molcik on 30/06/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct TabItem: Identifiable {
    var id: String {name}
    var name: String
    var icon: String?
    var customView: AnyView?
}

