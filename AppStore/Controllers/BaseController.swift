//
//  BaseController.swift
//  AppStore
//
//  Created by Niko Kim on 20.09.2020.
//

import UIKit

class BaseController: UICollectionViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
