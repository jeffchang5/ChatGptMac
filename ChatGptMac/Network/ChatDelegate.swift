//
//  ChatDelegate.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//

import Foundation

protocol ChatDelegate {
    
    func onSuccess(text: String)
    
    func onFailure(text: String)
    
}
