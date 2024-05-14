//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import UIKit

class HomeViewController: UIViewController {

    let viewModel = HomeViewModel()
    var articles: [ArticleModel]?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupTableView()
        // Do any additional setup after loading the view.
        viewModel.getHomeNews(urlString: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b1fcfcc3f3e841aebabb50e8cf9cd681") { articles in
            self.articles = articles
            self.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeCell")
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
//    func loadImage(urlString: String) -> UIImage? {
//    }
    
//    func loadImage(urlString: String) -> UIImage? {
//        guard let url = URL(string: urlString) else {
//            return nil
//        }
//        
//        if let data = try? Data(contentsOf: url) {
//            if let image = UIImage(data: data) {
//                return image
//            }
//        }
////        DispatchQueue.global().async { [weak self] in
////            if let data = try? Data(contentsOf: url) {
////                if let image = UIImage(data: data) {
////                    DispatchQueue.main.async {
////                        self?.image = image
////                    }
////                }
////            }
////        }
//        return nil
//    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToDetails(navigationController: self.navigationController ?? UINavigationController(), article: articles![indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 216
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        cell.newsImageView.load(urlString: articles?[indexPath.row].urlToImage ?? "")
        cell.titleLabel.text = articles?[indexPath.row].title ?? ""
        cell.authorLabel.text = articles?[indexPath.row].author ?? ""
        cell.descriptionLabel.text = articles?[indexPath.row].description ?? ""
        return cell
    }
    
}

extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else {
            self.image = UIImage(systemName: "questionmark.square")
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
