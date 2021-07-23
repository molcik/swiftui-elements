//
//  Picture.swift
//  sketch-elements
//
//  Created by Filip Molcik on 12/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Picture: Hashable, Codable {
    var uri: URL
    var preview: String?
}
