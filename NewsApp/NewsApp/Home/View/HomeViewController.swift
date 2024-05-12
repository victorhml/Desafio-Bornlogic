//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import UIKit

class HomeViewController: UIViewController {

    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.getHomeNews(urlString: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b1fcfcc3f3e841aebabb50e8cf9cd681") { artigos in
            print("\(artigos)")
        }
    }
    
}
