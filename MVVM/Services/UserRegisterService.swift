//
//  UserRegisterService.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//

import Foundation

class UserRegisterService : UserServiceProtocol
{
    func register(username: String, password: String) async -> Bool {
        
        print(username)
        print(password)
        
        return true;
    }
    
    
}
