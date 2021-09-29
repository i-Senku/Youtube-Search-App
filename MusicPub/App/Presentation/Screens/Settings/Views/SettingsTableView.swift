//
//  SettingsTableView.swift
//  MusicPub
//
//  Created by Ercan Garip on 28.09.2021.
//

import UIKit

class SettingsTableView: UITableView {
    
    override func awakeFromNib() {
        registerCell(nibName: "MainCell", cellId: "mainCell")
        registerCell(nibName: "OthersCell", cellId: "othersCell")
        delegate = self
        dataSource = self
        
    }
}

extension SettingsTableView : UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as! MainCell
            cell.populate(title: "Main Cell", image: "\(indexPath.row).circle")
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "othersCell") as! OthersCell
            cell.populate(title: "Others Cell", image: "\(indexPath.row).square")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Main Settings" : "Other Settings"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    
}
