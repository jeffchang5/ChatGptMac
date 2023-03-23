//
//  OpenAIClient.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//

import Foundation

class OpenAiClient {
    
    let openAI = OpenAISwift(authToken: "TOKEN")
    
    func sendMessage(text: String) {
        openAI.sendCompletion(with: "Hello how are you") { result in // Result<OpenAI, OpenAIError>
            switch result {
            case .success(let success):
                print(success.choices.first?.text ?? "")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
    }
}
