//
//  Message.swift
//  sketch-elements
//
//  Created by Filip Molcik on 13/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

struct Conversation: Hashable, Codable, Identifiable {
    var id: String
    var user: String
    var messages: [Message]
}

struct Message: Hashable, Codable, Identifiable {
    var id: String
    var me: Bool
    var message: String
    var timestamp: Double
}





