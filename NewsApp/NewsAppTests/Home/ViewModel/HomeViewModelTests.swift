//
//  HomeViewModelTests.swift
//  NewsAppTests
//
//  Created by Victor Hugo Martins Lisboa on 16/05/24.
//

import XCTest
@testable import NewsApp

final class HomeViewModelTests: XCTestCase {
    
    let viewModel = HomeViewModel()
    var navigationMock = UINavigationControllerMock()
    
    func test_get_home_news() {
        let url = "https://newsapi.org/v2/top-headlines?category=general&apiKey=b1fcfcc3f3e841aebabb50e8cf9cd681"
        viewModel.getHomeNews(urlString: url) { article in
            XCTAssertNotNil(article)
        }
    }
    
    func test_go_to_details() {
        let article = ArticleModel()
        viewModel.goToDetails(navigationController: navigationMock, article: article)
        XCTAssertNotNil(navigationMock.pushedViewController)
    }
}
