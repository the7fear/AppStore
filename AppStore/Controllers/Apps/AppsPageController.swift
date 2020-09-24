//
//  AppsPageController.swift
//  AppStore
//
//  Created by Niko Kim on 20.09.2020.
//

import UIKit
import SDWebImage

class AppsPageController: BaseController, UICollectionViewDelegateFlowLayout {
  
  private let cellId = "CellId"
  var groups = [AppsGroup]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    collectionView.register(AppPageCell.self, forCellWithReuseIdentifier: cellId)
    fetchITunesApps()
  }
  
  fileprivate func fetchITunesApps() {
    
    var group1: AppsGroup?
    var group2: AppsGroup?
    var group3: AppsGroup?
    
    let dispatchGroup = DispatchGroup()
    
    dispatchGroup.enter()
    Service.shared.fetchNewGames { (results, error) in
      dispatchGroup.leave()
      group1 = results
    }
    
    dispatchGroup.enter()
    Service.shared.fetchTopFree { (results, error) in
      dispatchGroup.leave()
      group2 = results
    }
    
    dispatchGroup.enter()
    Service.shared.fetchTopGrossing { (results, error) in
      dispatchGroup.leave()
      group3 = results
    }
    
    dispatchGroup.notify(queue: .main) {
      
      if let group = group1 {
        self.groups.append(group)
      }
      
      if let group = group2 {
        self.groups.append(group)
      }
      
      if let group = group3 {
        self.groups.append(group)
      }
      
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return groups.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppPageCell
    let result = groups[indexPath.item]
    cell.horizontalAppsController.appsResults = result
    cell.titleLabel.text = result.feed.title
    cell.horizontalAppsController.collectionView.reloadData()
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 300)
  }
}
