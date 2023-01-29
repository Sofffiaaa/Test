//
//  DateFormatter.swift
//  Test
//
//  Created by Head HandH on 28.01.2023.
//

import Foundation

protocol DateFormatterProtocol {
    func format(date: Date) -> String
}

final class DateFormatterImp {
    init(format: String) {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
    }
    
    private let dateFormatter: DateFormatter
}

extension   DateFormatterImp: DateFormatterProtocol {
    func format(date: Date) -> String {
        let formDate = dateFormatter.string(from: date)
        
        return formDate
    }
}
