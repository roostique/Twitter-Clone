//
//  FeedController.swift
//  Twitter
//
//  Created by Rustem Supayev on 05/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class FeedController: UIViewController {
    
    // MARK: - properties
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    // MARK: - helpers
    func configureUI() {
        
        view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
    }
}
