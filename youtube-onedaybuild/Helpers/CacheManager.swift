//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by 陳飛 on 10/10/20.
//

import Foundation


class CacheManager {
    
    // MARK: - Properties
    
    static var cache = [String: Data]()
    
    
    // MARK: - Methods
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        
        // Store the image data and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        // Try to get the data for the specified url
        return cache[url]
    }
}
