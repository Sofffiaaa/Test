//
//  Result.swift
//  Test
//
//  Created by Head HandH on 14.02.2023.
//

import Foundation

enum ProfileError: String, Error{
    case invalidURL = "The profile could not be found"
    case invalidResponse = "Invalid response from the server"
    case invalidData = "The data received from the server was invalid"
}


