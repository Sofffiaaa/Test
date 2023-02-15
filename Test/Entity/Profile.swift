//
//  Profile.swift
//  Test
//
//  Created by Head HandH on 01.02.2023.
//

import Foundation

struct Profile: Codable {
    typealias ID = String
    
    let id: ID
    let name: String
    let firstName: String
    let birthday: String
    
   
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case firstName = "first_name"
        case birthday = "happyday"
        }
}

