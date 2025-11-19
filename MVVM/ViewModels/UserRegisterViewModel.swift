//
//  UserRegisterViewModel.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//
import Foundation
import Combine

class UserRegisterViewModel: MainViewModel {
    
    private let service: UserRegisterService
  
    @Published var canSave: Bool = false
    @Published var acceptedTerms: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    @Published var username: String = ""
    {
        didSet
        {
        }
    }
    
    @Published var email: String = ""
    
	@Published var dateOfBirth: Date = Date()
    
    @Published var userGender: UserGender = .Other

	@Published var password: String = "" {
        didSet{
            if(!password.isEmpty)
            {
                voidValidatePassword()
            }
        }
    }
    @Published var confirmPassword: String = "" {
        didSet{
            if(!password.isEmpty)
            {
                voidValidatePassword()
            }
        }
    }
    
    
    func voidValidatePassword()
    {
        canSave = (password == confirmPassword && !password.isEmpty)
        if !canSave {
            print("Password not matched")
        }
    }
    
    // Computed property instead of stored property
    var isValid: Bool {
        canSave && acceptedTerms
    }
    
    
    init(service: UserRegisterService)
    {
        self.service = service
    }
    
    func register() async {
        guard !username.isEmpty else {
            alertMessage = "Username cannot be empty."
            showAlert = true
            return
        }
        
        guard email.contains("@") else {
            alertMessage = "Please enter a valid email."
            showAlert = true
            return
        }
        
        guard password == confirmPassword, !password.isEmpty else {
            alertMessage = "Passwords do not match."
            showAlert = true
            return
        }
        
        guard acceptedTerms else {
            alertMessage = "You must accept the terms."
            showAlert = true
            return
        }
        
        do
        {
            var user = try await self.service.createUser(username: self.username, email: self.email, password: self.password, dob: self.dateOfBirth, gender: self.userGender.rawValue)
            
            if(user != nil)
            {
                alertMessage = "User \(username) registered successfully!"
                ResetForm()
            }
            else
            {
                alertMessage = "User \(username) registered failed!"
            }
            
            showAlert = true
        }
        catch(let error)
        {
            print(error)
        }
    }
    
    private func ResetForm()
    {
        username = ""
        password = ""
        email = ""
        confirmPassword = ""
        dateOfBirth = Date()
    }
}
