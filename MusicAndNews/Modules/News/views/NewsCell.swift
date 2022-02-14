//
//  NewsCell.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 15/02/22.
//

import UIKit

class NewsCell: UITableViewCell {
    
    let image: CustomImageView = CustomImageView()
        .configure { v in
            v.contentMode = .scaleAspectFill
            v.translatesAutoresizingMaskIntoConstraints = false
            v.layer.masksToBounds = true
            v.image = Icon.placeholder
        }
    
    let lblDesc: UILabel = UILabel()
        .configure { v in
            v.font = UIFont.boldSystemFont(ofSize: 16)
            v.textAlignment = .left
            v.numberOfLines = 3
            v.textColor = Color.foreground
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lblAuthor: UILabel = UILabel()
        .configure { v in
            v.text = "Author"
            v.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            v.textAlignment = .left
            v.numberOfLines = 1
            v.textColor = Color.textGray
            v.translatesAutoresizingMaskIntoConstraints = false
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        // Configure the view for the selected state
    }
    
    func setupUI() {
        contentView.addSubview(image)
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        contentView.addSubview(lblDesc)
        lblDesc.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        lblDesc.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15).isActive = true
        lblDesc.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        contentView.addSubview(lblAuthor)
        lblAuthor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        lblAuthor.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15).isActive = true
        lblAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25).isActive = true
    }
}

extension NewsCell {
    func configureCellWith(data: Article) {
        self.image.loadImageUsingUrlString(urlString: data.urlToImage!)
        if let desc = data.description {
            self.lblDesc.text = desc != "" ? data.description : "Welcome!! You can choose your favorite news while listening to music"
        }
        if let author = data.author {
            self.lblAuthor.text = author != "" ? "Author: " + author : "Author: -"
        }
       
    }
}
