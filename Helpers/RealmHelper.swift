//
//  RealmHelper.swift
//  bcpApp
//
//  Created by samraj on 8/1/16.
//  Copyright © 2016 Samraj. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper{
    
    static func addUser(user: User) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(user)
        }
    }
    
    static func getUser(user: User) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(user)
        }
    }
    
}