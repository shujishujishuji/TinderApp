//
//  User.swift
//  MatchingApp
//
//  Created by taniguchi shuji on 2021/09/16.
//

import Foundation
import FirebaseFirestore

class User {
    
    var email: String
    var name: String
    var createdAt: Timestamp
    
    init(dic: [String: Any]) {
        self.email = dic["email"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
    }
    
}
