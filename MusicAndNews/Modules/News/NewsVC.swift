//
//  NewsVC.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.

import UIKit

class NewsVC: UIViewController, PlayerDelegate {
    
    var presentor: NewsViewToPresenterProtocol?
    public var delegate: NewsDelegate?
    
    var news : [Article] = [Article]()
    
    var musicStatus: Bool = false
    
    let player: PlayerView = PlayerView()
        .configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let tvNews: UITableView = UITableView()
        .configure { v in
            v.separatorStyle = .none
            v.register(NewsCell.self, forCellReuseIdentifier: Identifier.newsCell)
            v.contentInset.bottom = 150
            v.contentInset.top = 30
            v.translatesAutoresizingMaskIntoConstraints = false
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NEWS"
        view.backgroundColor = Color.background
        setupUI()
        
        presentor?.fethcNews()
        
        if musicStatus {
            player.musicStart()
        } else {
            player.musicStop()
        }
        player.delegate = self
        tvNews.delegate = self
        tvNews.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func musicPlayer(isPlaying: Bool) {
        if isPlaying {
            self.musicStatus = true
        } else {
            self.musicStatus = false
        }
        self.delegate?.music(status: musicStatus)
    }
}

extension NewsVC: NewsPresenterToViewProtocol {
    func didFetchNews(news: [Article]) {
        self.news = news
    }
    
    func didFailFetchNews(error: Error) {
        
    }
    
    
}

extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvNews.dequeueReusableCell(withIdentifier: Identifier.newsCell, for: indexPath) as! NewsCell
        cell.selectionStyle = .none
        let data = news[indexPath.row]
        cell.configureCellWith(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
}

extension NewsVC {
    func setupUI() {
        
        
        self.view.addSubview(tvNews)
        tvNews.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tvNews.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tvNews.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tvNews.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        self.view.addSubview(player)
        player.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        player.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        player.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        player.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }
}

