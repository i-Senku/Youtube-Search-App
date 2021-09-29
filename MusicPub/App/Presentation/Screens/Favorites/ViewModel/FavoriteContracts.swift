//
//  Contracts.swift
//  MusicPub
//
//  Created by Ercan Garip on 27.09.2021.
//

import Foundation

protocol FavoriteViewModelContracts {
    var delegate : FavoriteViewModelDelegate? { get set }
    var favoriteRepository : FavoriteRepositoryContracts? { get set }
    var favoriteList : [Favorites] { get set }
    
    //MARK: - Functions
    func loadFavorites()
    func didSelectItem(_ indexPath : IndexPath)
    func deleteFavorite(indexPath : IndexPath)
    func clear()
}

enum FavoriteViewModelRoutes {
    case videoDetail(videoID : String)
}

enum FavoriteViewModelOutput {
    case reloadTableView
    case cleared(Bool)
    case deleted(Bool)
}

protocol FavoriteViewModelDelegate : AnyObject {
    func handleOutput(output : FavoriteViewModelOutput)
    func route(route : FavoriteViewModelRoutes)
}
