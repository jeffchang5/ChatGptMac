//
//  MessageBubble.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//

import Foundation
import SwiftUI
import CoreData

struct ChatDetailScreen: View {
    
    @ObservedObject var viewModel = ChatViewModel()
    
    @State var newMessage: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        ScrollViewReader { scrollView in
            VStack {
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.messages) { message in
                            MessageRow(message: message)
                        }
                    }
                }
                .onChange(of: viewModel.messages) { messages in
                    withAnimation {
                        scrollView.scrollTo(messages.last?.id, anchor: .bottom)
                    }
                }
                HStack {
                    TextField("Type a message...", text: $newMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                
                        .onSubmit {
                            sendMessage()
                        }
                    Button(action: sendMessage) {
                        Text("Send")
                    }
                }
                .padding()
            }
        }
    }
    
    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        viewModel.sendChat(message: Message(role: Role.USER,  content: newMessage, timestamp: Date()))
        newMessage = ""
    }
}
