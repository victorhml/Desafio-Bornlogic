//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var article: ArticleModel?
    let viewModel = DetailViewModel()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupScrollView()
        setupContentView()
        setupDetailImageView()
        setupDateLabel()
        setupContentLabel()
        
        detailImageView.load(urlString: article?.urlToImage ?? "")
        dateLabel.text = (article?.publishedAt ?? "").changeDateFormat()
        contentLabel.text = article?.content ?? ""
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setupDetailImageView() {
        contentView.addSubview(detailImageView)
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            detailImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
    private func setupDateLabel() {
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 8),
            dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        ])
    }
    
    private func setupContentLabel() {
        contentView.addSubview(contentLabel)
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            contentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            contentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
