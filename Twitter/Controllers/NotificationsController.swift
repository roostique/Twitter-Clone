//
//  NotificationsController.swift
//  Twitter
//
//  Created by Rustem Supayev on 05/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class NotificationsController: UIViewController {
    
    // MARK: - properties
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()

    }
    
    // MARK: - helpers
    func configureUI() {
        
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
        
    }
    
}
