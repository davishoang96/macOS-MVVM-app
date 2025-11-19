//
//  AppProtocol.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//

protocol AppProtocol
{
    func display() async -> String
    func display(with text: String) async -> String
    func calculate(a: Int, b: Int) async -> Int
}
