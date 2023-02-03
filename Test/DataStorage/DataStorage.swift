//
//  DataStorage.swift
//  Test
//
//  Created by Head HandH on 01.02.2023.
//

import Foundation

protocol DataStorage {
 
    func save<Value: Codable>(value: Value, key: String)
    func value<Value: Codable>(key: String) -> Value?
}
