//
//  UserRegisterService.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//

import Foundation
import SwiftData

class UserRegisterService : UserServiceProtocol
{
	private let modelContext: ModelContext
		
	init(modelContext: ModelContext)
	{
		self.modelContext = modelContext
	}
	
	// CREATE
	func createUser(username: String, email: String, password: String,
				   dob: Date, gender: String) async throws -> UserModel
	{
		let user = UserModel(
			id: UUID(),
			username: username,
			email: email,
			password: password,
			dob: dob,
			gender: gender,
			createdAt: Date()
		)
		
		modelContext.insert(user)
		try modelContext.save()
		return user
	}
		
	
    func register(username: String, password: String) async -> Bool {
        
        print(username)
        print(password)
        
        return true;
    }
    
    
}
