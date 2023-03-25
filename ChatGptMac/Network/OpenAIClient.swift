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
    
    func sendMessage(messages: [Message]) async -> Result<Message, Error> {
        
        let chat = messages.map { message in
            let role: ChatRole
            if (message.role == Role.USER) {
                role = ChatRole.user
            } else {
                role = ChatRole.assistant
            }
            return ChatMessage(role: role, content: message.content)
        }
        do {
//            let chat: [ChatMessage] = [
//                ChatMessage(role: .system, content: "You are a helpful assistant."),
//                ChatMessage(role: .user, content: "Who won the world series in 2020?"),
//                ChatMessage(role: .assistant, content: "The Los Angeles Dodgers won the World Series in 2020."),
//                ChatMessage(role: .user, content: "Where was it played?")
//            ]
//
            let result = try await openAI.sendChat(with: chat)
            let role: Role
            if (result.choices.first?.message.role == ChatRole.assistant) {
                role = Role.BOT
            } else {
                role = Role.USER
            }
            let message = Message(role: role, content: result.choices[0].message.content, timestamp: Date())
            return Result.success(message)
        } catch {
            return Result.failure(error)
        }
    }
}
