//
//  OpenAIClient.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//

import Foundation
import OpenAISwift

class OpenAiClient {
    
    let openAI = OpenAISwift(authToken: Constants.API_KEY)
    
    var chatDelegate: ChatDelegate
    
    init (chatDelegate: ChatDelegate) {
        self.chatDelegate = chatDelegate
    }
    
    func sendMessage(text: String) async {
        do {
            let chat: [ChatMessage] = [
                ChatMessage(role: .system, content: "You are a helpful assistant."),
                ChatMessage(role: .user, content: "Who won the world series in 2020?"),
                ChatMessage(role: .assistant, content: "The Los Angeles Dodgers won the World Series in 2020."),
                ChatMessage(role: .user, content: "Where was it played?")
            ]
            
            let result = try await openAI.sendChat(with: chat)
            
            chatDelegate.onSuccess(text: result.choices[0].message.content)
            // use result
        } catch {
            // ...
            chatDelegate.onSuccess(text: "Failure")
        }
    }
}
