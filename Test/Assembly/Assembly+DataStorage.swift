//
//  Assembly+DataStorage.swift
//  Test
//
//  Created by Head HandH on 01.02.2023.
//

import Foundation

extension Assembly {
    var dataStorage: DataStorage {
        UserDefaultStorage(
        encoder: JSONEncoder(),
        decoder: JSONDecoder(),
        userDefaults: UserDefaults.standard
        )
    }
    
    private var encoder: JSONEncoder {
        JSONEncoder()
    }
    
    private var decoder: JSONDecoder {
        JSONDecoder()
    }
}
