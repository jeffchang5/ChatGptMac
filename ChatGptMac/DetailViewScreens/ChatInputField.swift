//
//  MessageBubble.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//

import Foundation
import SwiftUI
import CoreData

struct ChatInputField: View {
    
    @State var newMessage: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext

    
    @State private var messages: [Message] = [
        Message( role: Role.USER,  content: "hello world", timestamp: Date())
    ]


    var body: some View {
        VStack {
               List(messages) { message in
                   MessageRow(message: message)
               }
               HStack {
                   TextField("Type a message...", text: $newMessage)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                   Button(action: sendMessage) {
                       Text("Send")
                   }
               }
               .padding()
           }
    }
    
    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        messages.append(
            Message( role: Role.USER,  content: newMessage, timestamp: Date()))
        newMessage = ""
    }
}
