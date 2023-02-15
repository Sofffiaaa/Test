//
//  Assembly+ApiClient.swift
//  Test
//
//  Created by Head HandH on 03.02.2023.
//

import Foundation

extension Assembly {
    var apiClient: ApiClient {
        ApiClient(decoder: decoder)
    }
}
