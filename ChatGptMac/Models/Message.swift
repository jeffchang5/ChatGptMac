//
//  Message.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//

import Foundation
import SwiftUI

enum Role {
    case USER, BOT
}

struct Message : Identifiable, Equatable {
    
    let id = UUID()
    
    var content = ""
    
    var timestamp: Date?
    
    var role: Role
    
    init(role: Role, content: String, timestamp: Date) {
        self.role = role
        self.timestamp = timestamp
        self.content = content
    }
    
    init(messageEntity: MessageEntity) {
        if (messageEntity.role == "user") {
            self.role = Role.USER
        } else {
            self.role = Role.BOT
        }
        guard case self.content = messageEntity.content else {
            return
        }

        self.timestamp = messageEntity.timestamp
    }
}
