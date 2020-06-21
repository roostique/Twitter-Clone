//
//  PostTweetController.swift
//  Twitter
//
//  Created by Rustem Supayev on 08/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class PostTweetController: UIViewController {
    
    private let user: User
    
    private lazy var postTweetButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .twitterBlue
        btn.setTitle("Tweet", for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(.white, for: .normal)
        
        btn.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        btn.layer.cornerRadius = 32 / 2
        btn.addTarget(self, action: #selector(handlePostTweet), for: .touchUpInside)
        
        return btn
    }()
    
    private let profileImageView: UIButton = {
        let iv = UIButton()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .twitterBlue
        return iv
    }()
    
    private let captionTextView = CaptionTextView()
    
    // Позволяет не делать повторный API запрос и использовать данные,которые уже есть в main tab
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        print("DEBUG: User is \(user.username)")
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handlePostTweet() {
        guard let caption = captionTextView.text else { return }
        TweetService.shared.uploadTweet(caption: caption) { (error, ref) in
            if let error = error {
                print("DEBUG: Failed to post tweet with \(error.localizedDescription)")
                return
            }
            
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, captionTextView])
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .leading
        
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,right: view.rightAnchor,
                     paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        profileImageView.sd_setImage(with: user.profileImageUrl, for: .normal, completed: nil)
        
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: postTweetButton)
    }
}
