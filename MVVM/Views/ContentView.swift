//
//  ContentView.swift
//  MVVM
//
//  Created by davis on 18/11/2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: MainViewModel
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text(vm.message)
            
            // use $vm to bind with the variable from the viewmodel
            TextField("Enter username: ", text: $vm.userName)
            
            // Use brackets to call functions
            Button("Show Message")
            {
                        showAlert = true
                Task{
                    await vm.submit()
                }
            }
            .alert("Title here", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Your username is: \(vm.submittedName)")
            }

            Text("Submitted: \(vm.submittedName)")
        }
        .padding()
    }
}

#Preview {
    ContentView(vm: MainViewModel(service: AppService()))
}
