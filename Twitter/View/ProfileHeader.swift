//
//  ProfileHeader.swift
//  Twitter
//
//  Created by Rustem Supayev on 09/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    private let filterBar = ProfileFilterView()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue
        
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor,
                          paddingTop: 42, paddingLeft: 16)
        backButton.setDimensions(width: 34, height: 34)
        
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "back"), for: .normal)
        btn.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return btn
    }()
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4
        
        return iv
    }()
    
    private lazy var editProfileFollowButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Loading", for: .normal)
        btn.layer.borderColor = UIColor.twitterBlue.cgColor
        btn.layer.borderWidth = 1.3
        btn.setTitleColor(.twitterBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(handleEditFollow), for: .touchUpInside)
        return btn
    }()
    
    private lazy var fullnameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Elon Musk"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    }()
    
    private lazy var usernameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "@elon"
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    private lazy var bioLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 3
        lbl.text = "Uber X to Hidden Hills, give me somethin` i can feel, if they come to Hidden Hills then I know they know the deal"
        return lbl
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        filterBar.delegate = self
        
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor,
                             right: rightAnchor, height: 108)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: containerView.bottomAnchor, left: leftAnchor,
                                paddingTop: -24, paddingLeft: 12)
        profileImageView.setDimensions(width: 80, height: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        
        addSubview(editProfileFollowButton)
        editProfileFollowButton.anchor(top: containerView.bottomAnchor, right: rightAnchor,
                                       paddingTop: 12, paddingRight: 12)
        editProfileFollowButton.setDimensions(width: 100, height: 36)
        editProfileFollowButton.layer.cornerRadius = 36 / 2
        
        let userInfoStack = UIStackView(arrangedSubviews: [fullnameLabel,
                                                           usernameLabel,
                                                           bioLabel])
        userInfoStack.axis = .vertical
        userInfoStack.distribution = .fillProportionally
        userInfoStack.spacing = 4
        
        addSubview(userInfoStack)
        userInfoStack.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor,
                             paddingTop: 8, paddingLeft: 12, paddingRight: 12)
        
        addSubview(filterBar)
        filterBar.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)
        
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, width: frame.width / 3, height: 2)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDismiss() {
        print("Dismiss")
    }
    
    @objc func handleEditFollow() {
        print("Edit")
    }
    
    
}




extension ProfileHeader: ProfileFilterViewDelegate {
    func filterView(_ view: ProfileFilterView, didSelect indexPath: IndexPath) {
        guard let cell = view.collectionView.cellForItem(at: indexPath) as? ProfileFilterCell else { return }
        
        let xPosition = cell.frame.origin.x
        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = xPosition
        }
    }
}
