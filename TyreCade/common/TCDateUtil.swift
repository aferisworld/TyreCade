//
//  TCDateUtil.swift
//  TyreCade
//
//  Created by Nana Aferi on 06/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
class TCDateUtil {
    // class constants, Date formats
    static let DMY: String = "dd/MM/yyyy"
    static let DM: String = "MMM dd"
    

    // Get date string from timestamp using custom/default format
    static func timestampToDate (timestamp: Int64, format: String? = TCDateUtil.DMY) -> String {
        let timeInterval = TimeInterval(timestamp)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        dateFormatter.dateFormat = format
        
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    static func timestampToDate (timestamp: String, format: String? = TCDateUtil.DMY) throws -> String {
        if let intTimestamp = Int64(timestamp) {
            return TCDateUtil.timestampToDate(timestamp: intTimestamp, format: format)
        } else {
            throw TCErrors.DateError.InvalidTimestamp
        }
    }
}
