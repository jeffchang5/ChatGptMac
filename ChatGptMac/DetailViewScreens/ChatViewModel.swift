//
//  ChatViewModel.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//

import Foundation

class ChatViewModel : ObservableObject, ChatDelegate {
    @Published var messages = [Message]()
    
    let openAI: OpenAiClient
    
    init() {
        openAI = OpenAiClient(chatDelegate: self)
    }
    
    func sendChat(message: String) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.openAI.sendMessage(text: message)
       }
    }
    
    func onSuccess(text: String) {
        
    }
    
    func onFailure(text: String) {
        
    }
    
    

}

//class PokemonViewModel: ObservableObject {
//    @Published var pokemon = [Pokemon]()
//    @Published var filteredPokemon = [Pokemon]()
//
//    func fetchPokemon() {
//        guard let url = URL(string: BASE_URL) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data?.parseData(removeString: "null,") else { return }
//            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
//
//            DispatchQueue.main.async {
//                self.pokemon = pokemon
//            }
//        }.resume()
//    }
//
//    func filterPokemon(by filter: String) {
//        filteredPokemon = pokemon.filter({ $0.type == filter })
//    }
//}
