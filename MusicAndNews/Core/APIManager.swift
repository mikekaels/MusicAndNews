//
//  APIManager.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 15/02/22.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    let baseURL = "https://saurav.tech/NewsAPI/top-headlines/category/technology/us.json"
    
    func fetchNews(completion: @escaping(Result<NewsModel, Error>) -> Void) {
          URLSession.shared.dataTask(with: URL(string: baseURL)!) { (data, res, err) in
              guard let d = data else {
                  print("Data nil")
                  return
              }
              do {
                  let json = try JSONDecoder().decode(NewsModel.self, from: d)
                  completion(.success(json))
              } catch {
                  NSLog("ERROR \(error.localizedDescription)")
                  completion(.failure(error))
              }
              }.resume()
    }
}
