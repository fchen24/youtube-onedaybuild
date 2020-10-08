//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by 陳飛 on 7/10/20.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Pproperties
    var  model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

