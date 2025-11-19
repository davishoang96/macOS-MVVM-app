//
//  Untitled.swift
//  MVVM
//
//  Created by davis on 18/11/2025.
//

import Foundation
import Combine

class MainViewModel : ObservableObject
{
    
    private let service: AppService
    
    @Published var message = "This is my first mvvm macos app."
    @Published var userName: String = ""
    @Published var submittedName: String = ""
    
    init(service: AppService)
    {
        self.service = service
    }
    
    func submit() async
    {
        submittedName = userName
        print(await service.calculate(a: 1, b: 2))
    }
}
