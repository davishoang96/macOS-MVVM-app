//
//  Enum.swift
//  MVVM
//
//  Created by davis on 19/11/2025.
//
import Foundation

enum UserGender : String, CaseIterable, Identifiable
{
	case Female,
	Male,
	Gay,
	Lesbian,
	Bio,
	Helicopter,
	Tank,
	Other
    
    var id: String { rawValue } // needed for Picker
}
