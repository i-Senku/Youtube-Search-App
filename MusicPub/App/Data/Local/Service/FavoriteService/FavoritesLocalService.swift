//
//  FavoritesLocalService.swift
//  MusicPub
//
//  Created by Ercan Garip on 27.09.2021.
//

import Foundation

final class FavoritesLocalService : FavoritesLocalDataSource {
    
    func getFavorites() -> [Favorites] {
        return RealmHelper.shared.getList(Favorites.self)
    }
    
    func addFavorite(item: Favorites) -> Bool {
        do {
            try RealmHelper.shared.add(item)
            return true
        } catch let error {
            print(error)
            return false
        }
    }
    
    func deleteFavorite(item: Favorites) -> Bool {
        do {
            try RealmHelper.shared.delete(item)
            return true
        } catch _ {
            return false
        }
    }
    
    func deleteAllFavorites() -> Bool {
        do {
            try RealmHelper.shared.deleteObjectsOfType(type: Favorites.self)
            return true
        } catch let error {
            print(error)
            return false
        }
    }
    
    func favoriteIsAvailable(primaryKey : String) -> Favorites? {
        RealmHelper.shared.isAvailableWithPrimaryKey(Favorites.self, primaryKey: primaryKey)
    }
    
}
