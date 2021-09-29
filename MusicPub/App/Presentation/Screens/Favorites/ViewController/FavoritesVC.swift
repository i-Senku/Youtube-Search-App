//
//  FavoritesVC.swift
//  MusicPub
//
//  Created by Ercan Garip on 27.09.2021.
//

import UIKit

final class FavoritesVC: UIViewController {
    
    @IBOutlet weak var favoriteTableView: FavoriteTableView!
    
    let viewModel = FavoriteViewModel(favoriteRepository: FavoriteRepository(FavoritesLocalService()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        favoriteTableView.viewModel = viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadFavorites()
    }
    
    @IBAction func clearFavorites(_ sender: Any) {
        viewModel.clear()
    }
}

extension FavoritesVC  : FavoriteViewModelDelegate {
    
    func handleOutput(output: FavoriteViewModelOutput) {
        switch output {
        case .reloadTableView:
            favoriteTableView.reloadData()
        case .cleared(let status):
            if status {
                showBasicAlert(title: "Success", message: "Cleared favorites", actionTitle: "Close")
            }else {
                showBasicAlert(title: "Error", message: "Something went wrong", actionTitle: "Close")
            }
        case .deleted(let status) :
            if status {
                showBasicAlert(title: "Delete", message: "Favorite Successfully Deleted", actionTitle: "Close")
            }else{
                showBasicAlert(title: "Error", message: "Something went wrong", actionTitle: "Close")
            }
        }
    }
    
    func route(route: FavoriteViewModelRoutes) {
        switch route {
        case .videoDetail(let videoID):
            let detailVC = findStoryBoard(.videoDetail).instantiate(vc: VideoDetailVC.self) { coder in
                VideoDetailVC(coder: coder, videoID: videoID)
            }
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
