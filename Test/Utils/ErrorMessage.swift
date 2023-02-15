//
//  ErrorMessage.swift
//  Test
//
//  Created by Head HandH on 09.02.2023.
//

import Foundation

enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}
