//
//  Service.swift
//  AppStore
//
//  Created by Niko Kim on 23.09.2020.
//

import UIKit

class Service {
  
  static let shared = Service()
  
  func fetchApps(completion: @escaping (AppsGroups?, Error?) -> Void) {
    
    let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
    
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      if let error = error {
        print("Failed to fetch data", error)
        completion(nil, error)
      }
      
      guard let data = data else { return }
      
      do {
        let appGroup = try JSONDecoder().decode(AppsGroups.self, from: data)
        appGroup.feed.results.forEach({print($0.artistName)})
        completion(appGroup, nil)
      } catch let jsonError {
        print("Failed to decode data", jsonError)
        completion(nil, jsonError)
      }
    }.resume()
  }
}
