//
//  HomeModel.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import Foundation

struct HomeModel: Codable {
//    var status: String
//    var totalResults: Int
    var articles: [ArticlesModel]
//    var code: String?
//    var message: String?
}

struct ArticlesModel: Codable {
//    var source: SourceModel
    var author: String?
    var title: String?
    var description: String?
//    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

//struct SourceModel: Codable {
//    var id: String?
//    var name: String?
//}
