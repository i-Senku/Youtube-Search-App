//
//  HomeVC.swift
//  MusicPub
//
//  Created by Ercan Garip on 20.09.2021.
//

import UIKit

final class HomeVC: UIViewController {

    @IBOutlet weak var searchStatus: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var homeTableView: HomeTableView!
    @IBOutlet weak var searchBar: SearchBar!
    var viewModel : HomeViewModelContracts!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dependcyInjection()
        viewModel.delegate = self
    }
    
    func dependcyInjection(){
        viewModel = HomeViewModel(YoutubeRepository(ytService: YoutubeService()))        
        homeTableView.viewModel = viewModel
        searchBar.viewModel = viewModel
    }
}

extension HomeVC : HomeViewModelDelegate {
    func handleOutput(output: HomeViewModelOutput) {
        
        switch output {
        case .reloadTableView:
            self.homeTableView.reloadData()
        case .searchError(let error):
            searchStatus.text = error
            searchStatus.isHidden = false
            break
        case .setIndicator(let value):
            if value {
                activityIndicator.startAnimating()
                searchStatus.isHidden = true
            }else{
                activityIndicator.stopAnimating()
            }
        case .isListEmpty(let status):
            if status {
                searchStatus.text = "List Empty"
                searchStatus.isHidden = false
            }else {
                searchStatus.isHidden = true
            }
        }
    }
    
    
    func route(_ route: HomeViewModelRoutes) {
        switch route {
        case .videoDetail(let searchItem):
            let vc = findStoryBoard(.videoDetail).instantiate(vc: VideoDetailVC.self) { coder in
                VideoDetailVC(coder: coder, videoID: searchItem.id.videoId)
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
