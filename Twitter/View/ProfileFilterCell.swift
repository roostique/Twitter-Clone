//
//  ProfileFilterCell.swift
//  Twitter
//
//  Created by Rustem Supayev on 10/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class ProfileFilterCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.text = "Test tweet"
        return lbl
    }()
    
    override var isSelected: Bool {
        didSet {
            // Same as if...else statement
            titleLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 16) :
                UIFont.systemFont(ofSize: 14)
            titleLabel.textColor = isSelected ? .twitterBlue : .lightGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(titleLabel)
        titleLabel.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
