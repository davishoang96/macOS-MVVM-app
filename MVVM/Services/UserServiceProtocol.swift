//
//  UserRegisterProtocol.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//

import Foundation

protocol UserServiceProtocol {
    func register(username: String, password: String) async -> Bool
	func createUser(username: String, email: String, password: String, dob: Date, gender: String) async throws -> UserModel
}
