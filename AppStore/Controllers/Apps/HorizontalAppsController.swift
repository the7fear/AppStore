//
//  HorizontalAppsController.swift
//  AppStore
//
//  Created by Niko Kim on 21.09.2020.
//

import UIKit

class HorizontalAppsController: BaseController, UICollectionViewDelegateFlowLayout {
  
  fileprivate let cellId = "CellId"
  fileprivate let spacing: CGFloat = 8
  fileprivate let topBottomSpacing: CGFloat = 10
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    collectionView.register(HorizontalAppCell.self, forCellWithReuseIdentifier: cellId)
    if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
      layout.scrollDirection = .horizontal
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = view.frame.height
    return .init(width: view.frame.width - 48, height: (height - 4 * spacing - 2 * topBottomSpacing) / 3)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return spacing
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: topBottomSpacing, left: 12, bottom: topBottomSpacing, right: 12)
  }
}