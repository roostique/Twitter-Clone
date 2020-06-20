//
//  TweetHeader.swift
//  Twitter
//
//  Created by Rustem Supayev on 21/06/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class TweetHeader: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
