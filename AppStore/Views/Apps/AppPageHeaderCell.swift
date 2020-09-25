//
//  AppPageHeaderCell.swift
//  AppStore
//
//  Created by Niko Kim on 25.09.2020.
//

import UIKit

class AppPageHeaderCell: UICollectionViewCell {
  
  let headerHorizontalController = HeaderHorizontalController()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemGray2
    
    addSubview(headerHorizontalController.view)
    headerHorizontalController.view.fillSuperview()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
