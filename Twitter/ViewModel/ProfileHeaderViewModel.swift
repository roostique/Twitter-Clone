//
//  ProfileHeaderViewModel.swift
//  Twitter
//
//  Created by Rustem Supayev on 10/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit
import Firebase

// Data model
enum ProfileFilterOptions: Int, CaseIterable {
    
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}



struct ProfileHeaderViewModel {
    
    private let user: User
    
    let usernameText: String
    
    var followingString: NSAttributedString? {
        return attributedText(withValue: 0, text: " following")
    }
    
    var followersString: NSAttributedString? {
        return attributedText(withValue: 75, text: " followers")
    }
    
    var actionButtonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        } else {
            return "Follow"
        }
    }
    
    init(user: User) {
        self.user = user
        
        self.usernameText = "@" + user.username
    }
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)",
            attributes: [.font : UIFont.boldSystemFont(ofSize: 14)])
        
        attributedTitle.append(NSAttributedString(string: "\(text)",
            attributes: [.font : UIFont.boldSystemFont(ofSize: 14), .foregroundColor : UIColor.lightGray]))
        
        return attributedTitle
    }
}
