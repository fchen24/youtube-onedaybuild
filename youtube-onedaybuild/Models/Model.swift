//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by 陳飛 on 8/10/20.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate? // Delegate property
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, urlResponse, error) in
            
            // Check if there were any errors
            if error != nil && data == nil {
                
                print("There is some errors or response data does not exist.")
                
                return
            }
            
            do {
                
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                // Init response with decoder
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    // Call the "videosFetched" method of the delegate
                    self.delegate?.videosFetched(response.items!)
                }
                
//                dump(response)
            }
            catch {
                return
            }
        }
        
        // Kick off the task
        dataTask.resume()
    }
}
