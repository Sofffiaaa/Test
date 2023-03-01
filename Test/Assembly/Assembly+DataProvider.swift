//
//  Assembly+DataProvider.swift
//  Test
//
//  Created by Head HandH on 01.03.2023.
//

import Foundation

extension Assembly {
    var bootstrapDataProvider: BootstrapDataProvider {
        BootstrapDataProvider(apiClient: apiClient)
    }
}
