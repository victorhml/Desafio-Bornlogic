//
//  DetailCoordinator.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import UIKit

class DetailCoordinator: Coordinator {
    
    var article: ArticleModel?
    var viewModel: DetailViewModel?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = DetailViewController()
        viewController.article = article
        navigationController.pushViewController(viewController, animated: true)
    }
}
