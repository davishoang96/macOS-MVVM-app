//
//  UserRegisterView.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//
import Foundation
import SwiftUI
import SwiftData

struct UserRegisterView: View {
	@StateObject private var vm: UserRegisterViewModel
	
	init(modelContext: ModelContext) {
		_vm = StateObject(wrappedValue: UserRegisterViewModel(
			service: UserRegisterService(modelContext: modelContext)
		))
	}
    
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
                        
                        DatePicker("Date Of Birth", selection: $vm.dateOfBirth, displayedComponents: .date)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Picker("Select Role", selection: $vm.userGender) {
                            ForEach(UserGender.allCases) { gender in
                                Text(gender.rawValue.capitalized).tag(gender)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        
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
        let container = try! ModelContainer(for: UserModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        UserRegisterView(modelContext: container.mainContext)
    }
}
