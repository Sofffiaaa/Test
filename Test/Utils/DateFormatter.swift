//
//  DateFormatter.swift
//  Test
//
//  Created by Head HandH on 28.01.2023.
//

import Foundation

protocol DateFormatterProtocol {
    func format(date: Date) -> String
    func formatBack(date: String) -> Date?
}

final class DateFormatterImp {
    init(format: String) {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
    }
    
    init(format: Date) {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy, h:mm:ss a"
    }
    
    private let dateFormatter: DateFormatter
}

extension   DateFormatterImp: DateFormatterProtocol {
    func formatBack(date: String) -> Date? {
        if let formDate = dateFormatter.date(from: date){
            return formDate
        } else  {
            return nil
        }
    }
    
    func format(date: Date) -> String {
        let formDate = dateFormatter.string(from: date)
        return formDate
    }
    
}
