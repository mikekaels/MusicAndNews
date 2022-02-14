//
//  Player.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.
//

import UIKit
import AVFoundation

protocol PlayerDelegate {
    func musicPlayer(isPlaying: Bool)
}

class PlayerView: UIView {
    
    var audio: AVAudioPlayer?
    var isPlaying: Bool = false {
        didSet {
            configureUI(status: isPlaying)
        }
    }
    
    var delegate: PlayerDelegate?
    
    let btnPlay: UIButton = UIButton()
        .configure { v in
            v.setImage(Icon.play, for: .normal)
            v.widthAnchor.constraint(equalToConstant: 70).isActive = true
            v.heightAnchor.constraint(equalToConstant: 70).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(playerTapped), for: .touchUpInside)
            
        }
    
    let btnPause: UIButton = UIButton()
        .configure { v in
            v.setImage(Icon.pause, for: .normal)
            v.widthAnchor.constraint(equalToConstant: 70).isActive = true
            v.heightAnchor.constraint(equalToConstant: 70).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(playerTapped), for: .touchUpInside)
        }
    
    let svButtons: UIStackView = UIStackView()
        .configure { v in
            v.axis = .horizontal
            v.distribution = .fillEqually
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension PlayerView {
    func setupUI() {
        self.backgroundColor = Color.playerBackground
        
        self.addSubview(svButtons)
        svButtons.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        svButtons.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -100).isActive = true
        svButtons.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 100).isActive = true
        svButtons.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        [btnPlay, btnPause].forEach {svButtons.addArrangedSubview($0)}
        
        btnPlay.tintColor = .systemBlue
        btnPause.tintColor = .systemGray
    }
    
    @objc func playerTapped() {
        if MusicManager.shared.isPlaying {
            isPlaying = false
            delegate?.musicPlayer(isPlaying: false)
        } else {
            isPlaying = true
            delegate?.musicPlayer(isPlaying: true)
        }
        
        MusicManager.shared.player(path: "music.mp3")
    }
    
    func musicStart() {
        btnPlay.tintColor = .systemGray
        btnPause.tintColor = .systemBlue
        btnPlay.isUserInteractionEnabled = false
        btnPause.isUserInteractionEnabled = true
    }
    
    func musicStop() {
        btnPlay.tintColor = .systemBlue
        btnPause.tintColor = .systemGray
        btnPlay.isUserInteractionEnabled = true
        btnPause.isUserInteractionEnabled = false
    }
    
    func configureUI(status: Bool) {
        if status {
            musicStart()
        } else {
            musicStop()
        }
    }
}
