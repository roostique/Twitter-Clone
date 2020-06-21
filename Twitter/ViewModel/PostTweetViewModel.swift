//
//  PostTweetViewModel.swift
//  Twitter
//
//  Created by Rustem Supayev on 21/06/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

enum PostTweetConfiguration {
    case tweet
    case reply(Tweet)
}

struct PostTweetViewModel {
    let actionButtonTitle: String
    let placeholderText: String
    var shouldShowReplyLabel: Bool
    var replyText: String?
    
    init(config: PostTweetConfiguration) {
        switch config {
        case .tweet:
            actionButtonTitle = "Tweet"
            placeholderText = "What's happening?"
            shouldShowReplyLabel = false
        case .reply(let tweet):
            actionButtonTitle = "Reply"
            placeholderText = "Tweet your reply"
            shouldShowReplyLabel = true
            replyText = "Replying to @\(tweet.user.username)"
        }
    }
}
