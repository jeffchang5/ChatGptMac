//
//  Message.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//

import Foundation
import SwiftUI

extension MessageEntity {

    convenience init(context: NSManagedObjectContext, timestamp: Date, content: String, role: String) {
        self.init(context: context)
        self.timestamp = timestamp
        self.content = content
        self.role = role
    }
    
}




