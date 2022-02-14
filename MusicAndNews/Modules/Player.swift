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

class Player: UIView {
    
    var audio: AVAudioPlayer?
    var isPlaying: Bool = false
    
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

extension Player {
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
        let path = Bundle.main.path(forResource: "music.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audio = try AVAudioPlayer(contentsOf: url)
            if isPlaying {
                musicStop()
            } else {
                musicStart()
            }
            
        } catch {
            // couldn't load file :(
            fatalError("couldn't load file :(")
        }
    }
    
    func musicStart() {
        print("▶️")
        isPlaying = true
        audio?.play()
        btnPlay.tintColor = .systemGray
        btnPause.tintColor = .systemBlue
        btnPlay.isUserInteractionEnabled = false
        btnPause.isUserInteractionEnabled = true
        delegate?.musicPlayer(isPlaying: true)
    }
    
    func musicStop() {
        print("⏹")
        isPlaying = false
        audio?.stop()
        btnPlay.tintColor = .systemBlue
        btnPause.tintColor = .systemGray
        btnPlay.isUserInteractionEnabled = true
        btnPause.isUserInteractionEnabled = false
        delegate?.musicPlayer(isPlaying: false)
    }
    
    
}
