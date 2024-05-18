//
//  HomeTableViewCell.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
        
    lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var infoView: UIView = {
        let infoView = UIView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        return infoView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupNewsImageView()
        setupInfoView()
        setupTitleLabel()
        setupAuthorLabel()
        setupDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    private func setupNewsImageView() {
        contentView.addSubview(newsImageView)
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            newsImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    private func setupInfoView() {
        newsImageView.addSubview(infoView)
        NSLayoutConstraint.activate([
            infoView.leftAnchor.constraint(equalTo: newsImageView.leftAnchor),
            infoView.rightAnchor.constraint(equalTo: newsImageView.rightAnchor),
            infoView.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        infoView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: infoView.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: infoView.rightAnchor, constant: -8)
        ])
    }

    private func setupAuthorLabel() {
        infoView.addSubview(authorLabel)
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leftAnchor.constraint(equalTo: infoView.leftAnchor, constant: 8),
            authorLabel.rightAnchor.constraint(equalTo: infoView.rightAnchor, constant: -8)
        ])
    }
    
    private func setupDescriptionLabel() {
        infoView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            descriptionLabel.leftAnchor.constraint(equalTo: infoView.leftAnchor, constant: 8),
            descriptionLabel.rightAnchor.constraint(equalTo: infoView.rightAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -8)
        ])
    }
}
