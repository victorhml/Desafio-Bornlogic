//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import UIKit

class HomeViewController: UIViewController {

    let viewModel = HomeViewModel()
    var articles: [ArticlesModel]?
    
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HomeCell")
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath)
        cell.textLabel?.text = articles?[indexPath.row].title ?? ""
        return cell
    }
    
    
}
