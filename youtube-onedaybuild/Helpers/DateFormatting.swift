//
//  DateFormatting.swift
//  youtube-onedaybuild
//
//  Created by 陳飛 on 12/10/20.
//

import Foundation


struct DateFormatting {
    
    static func getDateFormattingString(_ date: Date) -> String? {
        
        // Create a date formatter
        let dateFormatter = DateFormatter()
        
        // Set the date formatting
        dateFormatter.dateFormat = Constants.DATE_FORMAT
        
        // Set the date format locale
        dateFormatter.locale = Locale(identifier: "en_US")
        
        // Convert Date type to String type
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}
