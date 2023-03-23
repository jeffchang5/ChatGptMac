//
//  MessageRow.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//

import Foundation
import SwiftUI

struct MessageRow: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.role == Role.USER {
                Spacer()
            }
            VStack(alignment: message.role == Role.USER ? .leading : .trailing) {
                Text(message.role == Role.USER ? "user" : "bot")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(message.content)
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            if message.role == Role.BOT {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}
