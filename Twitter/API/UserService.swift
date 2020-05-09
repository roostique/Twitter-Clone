//
//  UserService.swift
//  Twitter
//
//  Created by Rustem Supayev on 08/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void ) {        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
                        
            let user = User(uid: uid, dictionary: dictionary)  // Custom user object (model)
            completion(user)
            
        }
    }
}
