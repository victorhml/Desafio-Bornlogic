//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import Foundation
import UIKit

class HomeViewModel {
        
    func getHomeNews(urlString: String, completion: @escaping ([ArticleModel]) -> Void) {
        
        guard let url =  URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let resp = try decoder.decode(HomeModel.self, from: data)
                DispatchQueue.main.async {
                    completion(resp.articles)
                }
            } catch {
                print("\(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func goToDetails(navigationController: UINavigationController, article: ArticleModel) {
        let coord = HomeCoordinator(navigationController: navigationController)
        coord.article = article
        coord.goToDetails()
    }
}
