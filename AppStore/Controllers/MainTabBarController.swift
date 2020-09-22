//
//  MainTabBarController.swift
//  AppStore
//
//  Created by Niko Kim on 18.09.2020.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewControllers = [
      createNavigationController(viewController: AppsPageController(), title: "Apps", image: "apps"),
      createNavigationController(viewController: UIViewController(), title: "Search", image: "search"),
      createNavigationController(viewController: UIViewController(), title: "Today", image: "today_icon")
    ]
  }
  
  fileprivate func createNavigationController(viewController: UIViewController, title: String, image: String) -> UINavigationController {
    
    viewController.view.backgroundColor = .systemBlue
    viewController.navigationItem.title = title
    
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.tabBarItem.title = title
    navigationController.tabBarItem.image = UIImage(named: image)
    navigationController.navigationBar.prefersLargeTitles = true
    return navigationController
    
  }
}
