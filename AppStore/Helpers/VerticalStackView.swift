//
//  VerticalStackView.swift
//  AppStore
//
//  Created by Niko Kim on 22.09.2020.
//

import UIKit

class VerticalStackView: UIStackView {
  
  init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
    super.init(frame: .zero)
    arrangedSubviews.forEach({addArrangedSubview($0)})
    self.axis = .vertical
    self.spacing = spacing
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
