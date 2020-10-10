//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by 陳飛 on 10/10/20.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    // MARK: - Properties

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    // MARK: - Overrided Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Methods
    
    func setCell(_ video: Video) {
        
        // Save to property variable
        self.video = video
        
        // Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        // Set the title and date label
        self.titleLabel.text = self.video!.title
        
        let date = self.video?.publishedTime // Date object
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DATE_FORMAT
        dateFormatter.locale = Locale(identifier: "en_US")
        
        self.dateLabel.text = dateFormatter.string(from: date!)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set the thumbnail image view
            self.thumbnailImageView.image = UIImage(data: cacheData)
            
            return
        }
        
        // Downloading the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL Session Object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data!)
                
                // Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video!.thumbnail {
                    
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // Create the image object
                let imaege = UIImage(data: data!)
                
                // Set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = imaege
                }
            }
        }
        
        // Start data task
        dataTask.resume()
    }
}
