//
//  TweetHeader.swift
//  Twitter
//
//  Created by Rustem Supayev on 21/06/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class TweetHeader: UICollectionReusableView {
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .twitterBlue
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileImageTapped))
        iv.addGestureRecognizer(tap)
        iv.isUserInteractionEnabled = true
        
        return iv
    }()
    
    private lazy var fullnameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Elon Musk"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    private lazy var usernameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "@elon"
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    private let captionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.text = "Just some random tweet text for now"
        return lbl
    }()
    
    private let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = .lightGray
        lbl.text = "12:57 AM - 06/21/2020"
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let optionButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.tintColor = .lightGray
        btn.setImage(UIImage(named: "down_arrow"), for: .normal)
        btn.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        return btn
    }()
    
    private lazy var retweetsLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.text = "0 Retweets"
        return lbl
    }()
    
    private lazy var likesLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.text = "0 Likes"
        return lbl
    }()
    
    private lazy var statsView: UIView = {
        let view = UIView()
        
        let separator1 = UIView()
        separator1.backgroundColor = .systemGroupedBackground
        view.addSubview(separator1)
        separator1.anchor(top: view.topAnchor, left: view.leftAnchor,
                          right: view.rightAnchor,paddingLeft: 8, height: 1.0)
        
        let stack = UIStackView(arrangedSubviews: [retweetsLabel, likesLabel])
        stack.axis = .horizontal
        stack.spacing = 12
        
        view.addSubview(stack)
        stack.centerY(inView: view)
        stack.anchor(left: view.leftAnchor, paddingLeft: 16)
        
        let separator2 = UIView()
        separator2.backgroundColor = .systemGroupedBackground
        view.addSubview(separator2)
        separator2.anchor(left: view.leftAnchor, bottom: view.bottomAnchor,
                          right: view.rightAnchor, paddingLeft: 8, height: 1.0)
        
        return view
        
    }()
    
    private lazy var commentButton: UIButton = {
        let btn = createButton(withImageName: "comment")
        btn.addTarget(self, action: #selector(handleCommentTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var retweetButton: UIButton = {
        let btn = createButton(withImageName: "retweet")
        btn.addTarget(self, action: #selector(handleRetweetTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var likeButton: UIButton = {
        let btn = createButton(withImageName: "like")
        btn.addTarget(self, action: #selector(handleLikeTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var shareButton: UIButton = {
        let btn = createButton(withImageName: "share")
        btn.addTarget(self, action: #selector(handleShareTapped), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelStack = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel])
        labelStack.axis = .vertical
        labelStack.spacing = -6
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, labelStack])
        stack.spacing = 12
        
        addSubview(stack)
        stack.anchor(top: topAnchor, left: leftAnchor,
                     paddingTop: 16, paddingLeft: 16)
        
        addSubview(optionButton)
        optionButton.anchor(top: stack.topAnchor, right: rightAnchor,
                            paddingTop: 0, paddingRight: 8)
        
        addSubview(captionLabel)
        captionLabel.anchor(top: stack.bottomAnchor, left: leftAnchor, right: rightAnchor,
                            paddingTop: 20, paddingLeft: 16, paddingRight: 16)
        
        addSubview(dateLabel)
        dateLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor,
                         paddingTop: 20, paddingLeft: 16)
        
        addSubview(statsView)
        statsView.anchor(top: dateLabel.bottomAnchor, left: leftAnchor,
                         right: rightAnchor, paddingTop: 20, height: 40)
        
        let actionStack = UIStackView(arrangedSubviews: [commentButton, retweetButton,
                                                         likeButton, shareButton])
        actionStack.spacing = 72
        
        addSubview(actionStack)
        actionStack.centerX(inView: self)
        actionStack.anchor(bottom: bottomAnchor, paddingBottom: 12)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleProfileImageTapped() {
        print("DEBUG: Profile image tapped")
    }
    
    @objc func showActionSheet() {
        print("DEBUG: Action sheet button tapped")
    }
    
    @objc func handleCommentTapped() {
        print("DEBUG: Comment tapped")
    }
    
    @objc func handleRetweetTapped() {
        print("DEBUG: Retweet tapped")
    }
    
    @objc func handleLikeTapped() {
        print("DEBUG: like tapped")
    }
    
    @objc func handleShareTapped() {
        print("DEBUG: share tapped")
    }
    
    func createButton(withImageName imageName: String) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.tintColor = .darkGray
        btn.setDimensions(width: 20, height: 20)
        return btn
    }
}
