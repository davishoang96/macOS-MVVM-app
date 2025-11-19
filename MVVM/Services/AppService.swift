//
//  AppService.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//

class AppService : AppProtocol
{
    func display() async -> String
    {
        return "Hello, World";
    }
    
    func display(with text: String) async -> String
    {
        return text;
    }
    
    func calculate(a: Int, b: Int) async -> Int
    {
        // Run heavy computation off main thread
        await Task.detached(priority: .userInitiated)
        {
            var result = 0
            for i in 0..<1_000_000
            {
                result = i + 1
            }
            return a + b + result
        }.value
    }
}
