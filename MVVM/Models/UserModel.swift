//
//  UserModel.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//

import SwiftData
import Foundation

@Model
class UserModel {
	var id: UUID
    var username: String
	var email: String
	var password: String
	var dob: Date
	var gender: String
	var createdAt: Date
	
	init(id: UUID, username: String, email: String, password: String,
		 dob: Date, gender: String, createdAt: Date) {
		self.id = id
		self.username = username
		self.email = email
		self.password = password
		self.dob = dob
		self.gender = gender
		self.createdAt = createdAt
	}
}
