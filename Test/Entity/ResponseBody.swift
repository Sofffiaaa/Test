//
//  ResponseBody.swift
//  Test
//
//  Created by Head HandH on 03.02.2023.
//

import Foundation

struct ResponseBody<ApiData: Decodable>: Decodable {
    let data: ApiData?
    let error: ApiErrorData?
}
