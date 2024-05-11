//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        HomeViewModel().getHomeNews(urlString: "https://newsapi.org/v2/everything") { artigos in
            print("\(artigos)")
        }
    }
    
}
