//
//  MVVMApp.swift
//  MVVM
//
//  Created by davis on 18/11/2025.
//

import SwiftUI

@main
struct MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            UserRegisterView(vm: UserRegisterViewModel(service: UserRegisterService()))
        }
    }
}
