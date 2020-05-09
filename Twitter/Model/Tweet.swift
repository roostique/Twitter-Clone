//
//  Tweet.swift
//  Twitter
//
//  Created by Rustem Supayev on 08/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import Foundation

struct Tweet {
    let caption: String
    let tweetID: String
    let likes: Int
    let retweets: Int
    var timestamp: Date!
    let user: User
    
    init(user: User, tweetID: String, dictionary: [String: Any]) {
        self.tweetID = tweetID
        self.user = user
        
        self.caption = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweets = dictionary["retweets"] as? Int ?? 0
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
    }
}
