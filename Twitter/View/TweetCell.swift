//
//  TweetCell.swift
//  Twitter
//
//  Created by Rustem Supayev on 08/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    
    var tweet: Tweet? {
        didSet { configure() }
    }
    
    private let profileImageView: UIButton = {
        let iv = UIButton()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .twitterBlue
        return iv
    }()
    
    private let captionLabel: UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.numberOfLines = 0  // Бесконечное число строк
        lbl.text = "Just some random tweet text"
        return lbl
    }()
    
    private lazy var commentButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "comment"), for: .normal)
        btn.tintColor = .darkGray
        btn.setDimensions(width: 20, height: 20)
        btn.addTarget(self, action: #selector(handleCommentTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var retweetButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "retweet"), for: .normal)
        btn.tintColor = .darkGray
        btn.setDimensions(width: 20, height: 20)
        btn.addTarget(self, action: #selector(handleRetweetTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var likeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "like"), for: .normal)
        btn.tintColor = .darkGray
        btn.setDimensions(width: 20, height: 20)
        btn.addTarget(self, action: #selector(handleLikeTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var shareButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "share"), for: .normal)
        btn.tintColor = .darkGray
        btn.setDimensions(width: 20, height: 20)
        btn.addTarget(self, action: #selector(handleShareTapped), for: .touchUpInside)
        return btn
    }()
    
    private let userInfoLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 8, paddingLeft: 8)
        
        let stack = UIStackView(arrangedSubviews: [userInfoLabel, captionLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor,
                     right: rightAnchor, paddingLeft: 12, paddingRight: 12)
        
        userInfoLabel.text = "Elon Musk @elon"
        userInfoLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        let actionStack = UIStackView(arrangedSubviews: [commentButton, retweetButton,
                                                         likeButton, shareButton])
        actionStack.axis = .horizontal
        actionStack.spacing = 72
        
        addSubview(actionStack)
        actionStack.centerX(inView: self)
        actionStack.anchor(bottom: bottomAnchor, paddingBottom: 8)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .systemGroupedBackground
        addSubview(separatorView)
        separatorView.anchor(left: leftAnchor, bottom: bottomAnchor,
                             right: rightAnchor, height: 1)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark - Selectors
    @objc func handleCommentTapped() {
        print("comment")
    }
    
    @objc func handleRetweetTapped() {
        print("retweet")
    }
    
    @objc func handleLikeTapped() {
        print("like")
    }
    
    @objc func handleShareTapped() {
        print("share")
    }
    
    func configure() {
        guard let tweet = tweet else { return }
        
        captionLabel.text = tweet.caption
    }
}
