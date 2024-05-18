//
//  HomeModel.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import Foundation

struct HomeModel: Codable {
    var articles: [ArticleModel]
}

struct ArticleModel: Codable {
    var author: String?
    var title: String?
    var description: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
