//
//  MusicVC.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.

import UIKit

class MusicVC: UIViewController {
    var presentor: MusicViewToPresenterProtocol?
    public var delegate: MusicDelegate?
    
    let label1: UILabel = UILabel()
        .configure { v in
            v.text = "Welcome!! You can choose your favorite news while listening to music"
            v.font = UIFont.boldSystemFont(ofSize: 30)
            v.textAlignment = .center
            v.numberOfLines = 0
            v.textColor = Color.foreground
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let label2: UILabel = UILabel()
        .configure { v in
            v.text = "Oops... Music stop playing"
            v.font = UIFont.boldSystemFont(ofSize: 25)
            v.textAlignment = .center
            v.numberOfLines = 0
            v.textColor = Color.foreground
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let player: Player = Player()
        .configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = Color.background
        setupUI()
        player.delegate = self
    }
    
    

}

extension MusicVC: PlayerDelegate {
    func musicPlayer(isPlaying: Bool) {
        if isPlaying {
            self.label2.text = "Music is playing.. Enjoy!!"
        } else {
            self.label2.text = "Ooops... Music stop playing"
        }
    }
}

extension MusicVC: MusicPresenterToViewProtocol {
    
}

extension MusicVC {
    func setupUI() {
        self.view.addSubview(label1)
        label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        label1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        self.view.addSubview(label2)
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 100).isActive = true
        label2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        label2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        self.view.addSubview(player)
        player.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        player.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        player.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        player.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }
}
