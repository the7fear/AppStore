//
//  Extensions.swift
//  AppStore
//
//  Created by Niko Kim on 21.09.2020.
//

import UIKit

extension UILabel {
  convenience init(text: String, font: UIFont) {
    self.init(frame: .zero)
    self.text = text
    self.font = font
  }
}

extension UIButton {
  convenience init(title: String, cornerRadius: CGFloat) {
    self.init(type: .system)
    self.layer.cornerRadius = cornerRadius
    self.setTitle(title, for: .normal)
  }
}

extension UIImageView {
  convenience init(cornerRadius: CGFloat) {
    self.init(image: nil)
    self.layer.cornerRadius = cornerRadius
    self.clipsToBounds = true
  }
}
