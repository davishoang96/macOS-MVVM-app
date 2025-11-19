//
//  UserRegisterProtocol.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//

protocol UserServiceProtocol {
    func register(username: String, password: String) async -> Bool
}
