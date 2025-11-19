//
//  MVVMApp.swift
//  MVVM
//
//  Created by davis on 18/11/2025.
//

import SwiftUI
import SwiftData

@main
struct MVVMApp: App {
	let modelContainer: ModelContainer
	
	init() {
		do {
			modelContainer = try ModelContainer(for: UserModel.self)
		} catch {
			fatalError("Could not initialize ModelContainer: \(error)")
		}
	}
	
    var body: some Scene {
        WindowGroup {
			UserRegisterView(modelContext: modelContainer.mainContext)
        }
		.modelContainer(modelContainer)
    }
}
