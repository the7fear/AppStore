//
//  HorizontalSnappingController.swift
//  AppStore
//
//  Created by Niko Kim on 26.09.2020.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
  
  init() {
    let layout = BetterSnappingLayout()
    layout.scrollDirection = .horizontal
    super.init(collectionViewLayout: layout)
    collectionView.decelerationRate = .fast
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
