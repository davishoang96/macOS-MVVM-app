//
//  UserRegisterView.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//
import Foundation
import SwiftUI

import SwiftUI

struct UserRegisterView: View {
    @StateObject var vm = UserRegisterViewModel(service: UserRegisterService())
    
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // MARK: - Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Create Account")
                            .font(.largeTitle)
                            .bold()
                        Text("Fill in the form to register a new account")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    // MARK: - Form Fields
                    VStack(spacing: 15) {
                        TextField("Username", text: $vm.username)
                            .textFieldStyle(.roundedBorder)
                            .disableAutocorrection(true)
                        
                        TextField("Email", text: $vm.email)
                            .textFieldStyle(.roundedBorder)
                        
                        SecureField("Password", text: $vm.password)
                            .textFieldStyle(.roundedBorder)
                        
                        SecureField("Confirm Password", text: $vm.confirmPassword)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Terms Toggle
                    Toggle(isOn: $vm.acceptedTerms) {
                        Text("Accept Terms and Conditions")
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Register Button
                    Button {
                        Task { await vm.register() }
                    } label: {
                        Text("Register")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 30)
                            .background(vm.canSave ? Color.blue : Color.gray)
                            .cornerRadius(8)
                            .bold()
                    }
                    .disabled(!vm.acceptedTerms)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                }
                .padding(.bottom)
            }
            .navigationTitle("User Registration")
            .alert(vm.alertMessage, isPresented: $vm.showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
}


// MARK: - Preview
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegisterView()
    }
}
