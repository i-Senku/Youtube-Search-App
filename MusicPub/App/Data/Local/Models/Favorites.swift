//
//  Favorites.swift
//  MusicPub
//
//  Created by Ercan Garip on 26.09.2021.
//

import RealmSwift

class Favorites : Object {
    @Persisted var id : String!
    @Persisted var title : String!
    @Persisted var thumbnail : String!
    @Persisted var statistics : Statistics?
    
    convenience init(id : String,title : String,thumbnail : String?,statistics : Statistics? = nil) {
        self.init()
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.statistics = statistics
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
}
