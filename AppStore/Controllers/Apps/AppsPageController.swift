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
  var results: AppsGroups?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    collectionView.register(AppPageCell.self, forCellWithReuseIdentifier: cellId)
    fetchITunesApps()
  }
  
  fileprivate func fetchITunesApps() {
    Service.shared.fetchApps { (results, error) in
      self.results = results
      
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppPageCell
    cell.horizontalAppsController.appsResults = results
    cell.titleLabel.text = results?.feed.title
    cell.horizontalAppsController.collectionView.reloadData()
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 300)
  }
}
