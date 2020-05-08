//
//  Constants.swift
//  Twitter
//
//  Created by Rustem Supayev on 07/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_TWEETS = DB_REF.child("tweets")
