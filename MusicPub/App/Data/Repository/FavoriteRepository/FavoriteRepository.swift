//
//  FavoriteRepository.swift
//  MusicPub
//
//  Created by Ercan Garip on 27.09.2021.
//

import Foundation

final class FavoriteRepository : FavoriteRepositoryContracts {
    
    var localFavoriteService : FavoritesLocalDataSource
    
    init(_ favoriteLocalDataSource : FavoritesLocalDataSource) {
        self.localFavoriteService = favoriteLocalDataSource
    }
    
    func getFavorites() -> [Favorites] {
        return localFavoriteService.getFavorites()
    }
    
    func addFavorite(item: Favorites) -> Bool {
        return localFavoriteService.addFavorite(item: item)
    }
    
    func deleteFavorite(item : Favorites) -> Bool {
        return localFavoriteService.deleteFavorite(item: item)
    }
    
    func deleteFavoriteById(id: String) -> Bool {
        let item = favoriteIsAvailable(primaryKey: id)
        if let item = item {
            return deleteFavorite(item: item)
        }else{
            return false
        }
    }
    
    func deleteAllFavorites() -> Bool {
        return localFavoriteService.deleteAllFavorites()
    }
    
    func favoriteIsAvailable(primaryKey: String) -> Favorites? {
        return localFavoriteService.favoriteIsAvailable(primaryKey: primaryKey)
    }
}
