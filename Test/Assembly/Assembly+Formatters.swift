//
//  Assembly+Formatters.swift
//  Test
//
//  Created by Head HandH on 28.01.2023.
//

import Foundation

extension Assembly{
    
    enum DateFormat: String{
        case yyyyMMdd = "yyyy MM dd"
        case HHmmss = "HH:mm:ss"
    }
    
    func dateFormatter(format: DateFormat) -> DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter
    }
}
