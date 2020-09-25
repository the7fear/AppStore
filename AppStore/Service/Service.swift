//
//  Service.swift
//  AppStore
//
//  Created by Niko Kim on 23.09.2020.
//

import UIKit

class Service {
  
  static let shared = Service()
  
  func fetchSearchResults(searchText: String, completion: @escaping (SearchResults?, Error?) -> Void) {
    let urlString = "https://itunes.apple.com/search?term=\(searchText)&entity=software"
    fetchApps(urlString: urlString, completion: completion)
  }
  
  func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
    let urlString = "http://api.letsbuildthatapp.com/appstore/social"
    fetchApps(urlString: urlString, completion: completion)
  }
  
  func fetchNewGames(completion: @escaping (AppsGroup?, Error?) -> Void) {
    let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
    fetchApps(urlString: urlString, completion: completion)
  }
  
  func fetchTopFree(completion: @escaping (AppsGroup?, Error?) -> Void) {
    let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json"
    fetchApps(urlString: urlString, completion: completion)
  }
  
  func fetchTopGrossing(completion: @escaping (AppsGroup?, Error?) -> Void) {
    let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
    fetchApps(urlString: urlString, completion: completion)
  }
  
  func fetchApps<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      if let error = error {
        print("Failed to fetch data", error)
        completion(nil, error)
      }
      
      guard let data = data else { return }
      
      do {
        let object = try JSONDecoder().decode(T.self, from: data)
        completion(object, nil)
      } catch let jsonError {
        print("Failed to decode data", jsonError)
        completion(nil, jsonError)
      }
    }.resume()
  }
}
