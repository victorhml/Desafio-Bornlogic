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
    var categories = ["General", "Business", "Entertainment", "Health", "Science", "Sports", "Technology"]
    
    private lazy var loadingView: UIView = {
        let loadingView = UIView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .medium
        return activityIndicator
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: categories)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(didChangeSegment), for: .valueChanged)
        return segmentedControl
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        didChangeSegment(segmentedControl)
        title = "Notícias"
    }
    
    
    private func setupLoading() {
        tableView.removeFromSuperview()
        view.addSubview(loadingView)
        loadingView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor)
        ])
    }
    
    private func setupSegmentedControl() {
        activityIndicator.stopAnimating()
        loadingView.removeFromSuperview()
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeCell")
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func didChangeSegment(_ sender: UISegmentedControl) {
        setupLoading()
        viewModel.getHomeNews(urlString: "https://newsapi.org/v2/top-headlines?category=\(sender.titleForSegment(at: sender.selectedSegmentIndex)?.lowercased() ?? "")&apiKey=b1fcfcc3f3e841aebabb50e8cf9cd681") { articles in
            self.setupSegmentedControl()
            self.setupTableView()
            self.articles = articles
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToDetails(navigationController: self.navigationController ?? UINavigationController(), article: articles![indexPath.row])
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        cell.newsImageView.load(urlString: articles?[indexPath.row].urlToImage ?? "")
        cell.titleLabel.text = articles?[indexPath.row].title ?? ""
        cell.authorLabel.text = articles?[indexPath.row].author ?? ""
        cell.descriptionLabel.text = articles?[indexPath.row].description ?? ""
        return cell
    }
    
}
