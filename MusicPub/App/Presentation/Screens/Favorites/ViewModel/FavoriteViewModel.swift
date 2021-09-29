//
//  FavoriteViewModel.swift
//  MusicPub
//
//  Created by Ercan Garip on 27.09.2021.
//

import Foundation

final class FavoriteViewModel : FavoriteViewModelContracts {
    
    weak var delegate: FavoriteViewModelDelegate?
    var favoriteRepository: FavoriteRepositoryContracts?
    var favoriteList: [Favorites] = []
    
    init(favoriteRepository : FavoriteRepositoryContracts) {
        self.favoriteRepository = favoriteRepository
    }
    
    func loadFavorites() {
        favoriteList = favoriteRepository?.getFavorites() ?? []
        notify(.reloadTableView)
    }
    
    func didSelectItem(_ indexPath: IndexPath) {
        let selectedItem = favoriteList[indexPath.row]
        delegate?.route(route: .videoDetail(videoID: selectedItem.id))
    }
    
    func clear() {
        let status = favoriteRepository?.deleteAllFavorites()
        if let status = status {
            loadFavorites()
            notify(.cleared(status))
        }else{
            notify(.cleared(false))
        }
    }
    
    func deleteFavorite(indexPath : IndexPath) {
        let item = favoriteList[indexPath.row]
        let status = favoriteRepository?.deleteFavorite(item: item)
        if let status = status {
            favoriteList.remove(at: indexPath.row)
            notify(.reloadTableView)
            notify(.deleted(status))
        }else {
            notify(.deleted(false))
        }
    }
    
    
    fileprivate func notify(_ output : FavoriteViewModelOutput){
        delegate?.handleOutput(output: output)
    }
    
}
