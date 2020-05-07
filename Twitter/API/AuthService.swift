//
//  AuthService.swift
//  Twitter
//
//  Created by Rustem Supayev on 07/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit
import Firebase

struct AuthService {
    
    static let shared = AuthService()
    
    func logInUser(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func signUpUser(credentials: AuthData, completion: @escaping(Error?, DatabaseReference) -> Void) {
        
        let email = credentials.email
        let password = credentials.password
        let fullname = credentials.fullname
        let username = credentials.username
        
        // Выгрузка фотографии профиля в базу данных
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(filename)
        storageRef.putData(imageData, metadata: nil) { (meta, error) in
            storageRef.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                // Аутентификация пользователя
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    
                    if let error = error {
                        print("DEBUG: error is \(error.localizedDescription)")
                        return
                    }
                    
                    guard let uid = result?.user.uid else { return }
                    
                    let values = ["email": email,
                                  "fullname": fullname,
                                  "username": username,
                                  "profileImageUrl": profileImageUrl]
                    
                    REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                    
                }
                
            }
        }
        
    }
}
