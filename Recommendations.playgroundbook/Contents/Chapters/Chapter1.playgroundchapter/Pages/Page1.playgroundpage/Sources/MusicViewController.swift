//
//  MusicViewController.swift
//  WWDC Scholarship 2019
//
//  Created by Andy Vainauskas on 3/21/19.
//  Copyright (c) 2019 Andy Vainauskas. All rights reserved.
//

import PlaygroundSupport
import UIKit
import SpriteKit

public class MusicViewController: UIViewController {
    var musicView: SKView!
    var scene: ArtistScene!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        musicView = SKView(frame: self.view.frame)
        view.addSubview(musicView)
        musicView.backgroundColor = SKColor.white
        musicView.ignoresSiblingOrder = true
        
        scene = ArtistScene(size: view.frame.size)
        scene.scaleMode = .aspectFill
        musicView.presentScene(scene)
        
        // Reset ratings from Playground book data store
        for artist in artistNames {
            if let keyValue = PlaygroundKeyValueStore.current[artist.key],
                case .integer(let rating) = keyValue {
                PlaygroundKeyValueStore.current[artist.key] = .integer(0)
            }
        }
        
        // Add initial artist bubbles
        for name in artistNames.shuffled() {
            addBubble(artistName: name.key)
        }
    }
    
    // Update center and frame of SpriteKit view as size of superview changes
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if self.musicView != nil {
            self.musicView.center = self.view.center
            self.musicView.frame = self.view.frame
        }
    }
    
    func addBubble(artistName: String) {
        let newNode = ArtistNode.instantiate(title: artistName)
        scene.addChild(newNode)
    }
    
    func commitSelection() {
        scene.performCommitSelectionAnimation()
    }
}

