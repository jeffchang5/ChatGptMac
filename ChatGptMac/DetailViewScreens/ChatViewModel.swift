//
//  ChatViewModel.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//
import Combine
import Foundation

class ChatViewModel : ObservableObject {
    
    @Published var messages = [Message]()
    
    let openAI: OpenAiClient
    
    init() {
        openAI = OpenAiClient()
    }
    
    func sendChat(message: Message) {
        messages.append(message)
        Task.detached {
            let result = await self.openAI.sendMessage(messages: self.messages)
            DispatchQueue.main.async {
                // Update the UI with the result on the main thread
                do {
                    self.messages.append(try result.get())
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
}
