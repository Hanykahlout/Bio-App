//
//  UserData.swift
//  firstApp
//
//  Created by Hany Kh on 15/07/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import Foundation
class UserData {
    func save(user:User) {
        UserDefaults.standard.set(user.name, forKey: "Name")
        UserDefaults.standard.set(user.email, forKey: "Email")
        UserDefaults.standard.set(user.city, forKey: "City")
    }
    func getUserData() -> User {
        let name = UserDefaults.standard.string(forKey: "Name") ?? ""
        let email = UserDefaults.standard.string(forKey: "Email") ?? ""
        let city = UserDefaults.standard.string(forKey: "City") ?? ""
        return User(name: name, email: email, city: city)
    }
    
    
}
