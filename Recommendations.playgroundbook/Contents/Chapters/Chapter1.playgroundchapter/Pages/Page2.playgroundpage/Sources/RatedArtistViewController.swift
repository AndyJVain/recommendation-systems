//
//  RatedArtistViewController.swift
//  WWDC Scholarship 2019
//
//  Created by Andy Vainauskas on 3/21/19.
//  Copyright (c) 2019 Andy Vainauskas. All rights reserved.
//

import PlaygroundSupport
import UIKit
import SpriteKit

public class RatedArtistViewController: UIViewController {
    var headerLabel: UILabel!
    var musicView: SKView!
    var scene: RatedArtistScene!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        musicView = SKView(frame: self.view.frame)
        musicView.backgroundColor = SKColor.white
        musicView.ignoresSiblingOrder = true
        view.addSubview(musicView)
        
        scene = RatedArtistScene(size: view.frame.size)
        scene.scaleMode = .aspectFill
        musicView.presentScene(scene)
        
        createHeader()
        addArtists()
    }
    
    // Update center and frame of SpriteKit view as size of superview changes
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if self.musicView != nil {
            self.musicView.center = self.view.center
            self.musicView.frame = self.view.frame
        }
        
        if self.headerLabel != nil {
            self.headerLabel.center.x = self.view.center.x
        }
    }
    
    func createHeader() {
        headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: 40))
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "HelveticaNeue", size: 36)
        headerLabel.text = "Your Favorites:"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(headerLabel)
        
//        let verConstraint = NSLayoutConstraint(item: headerLabel, attribute: .centerY, relatedBy: .equal,
//                                               toItem: view, attribute: .centerY, multiplier: 1.0, constant: -280.0)
        let verConstraint = NSLayoutConstraint(item: headerLabel, attribute: .top, relatedBy: .equal,
                                               toItem: view, attribute: .top, multiplier: 1.0, constant: 100.0)
        self.view.addConstraints([verConstraint])
    }
    
    func addArtists() {
        for artist in artistNames.shuffled() {
            if let keyValue = PlaygroundKeyValueStore.current[artist.key],
                case .integer(let rating) = keyValue {
                if (rating == 1) {
                    addBubble(artistName: artist.key)
                }
            }
        }
    }
    
    func addBubble(artistName: String) {
        let newNode = RatedArtistNode.instantiate(title: artistName)
        scene.addChild(newNode)
    }
    
    func commitSelection() {
        scene.performCommitSelectionAnimation()
    }
    
    public func updateNodes(withNames names: [String]) {
        var namesArray = names
        scene.enumerateChildNodes(withName: "//*") { (node, stop) in
            if node is RatedArtistNode {
                let artistNode = node as! RatedArtistNode
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
                let attributes: [NSAttributedString.Key : Any] = [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                    NSAttributedStringKey.foregroundColor : UIColor.white,
                    NSAttributedStringKey.font : UIFont.systemFont(ofSize: artistBubbleFontSize)
                ]
                let attrString = NSAttributedString(string: "\(namesArray.first!)", attributes: attributes)
                
                // Animate
                let duration = 0.7
                let fadeOut = SKAction.fadeOut(withDuration: duration)
                let changeText = SKAction.run({ artistNode.labelNode.attributedText = attrString })
                let fadeIn = SKAction.fadeIn(withDuration: duration)
        
                let labelAnimationList = SKAction.sequence([fadeOut, changeText, fadeIn])
                let nodeAnimationList = SKAction.sequence([fadeOut, fadeIn])
                artistNode.labelNode.run(labelAnimationList)
                artistNode.run(nodeAnimationList)
                namesArray.removeFirst(1)
            }
        }
    }
    
    public func updateHeader() {
        let duration = 0.7
        
        UIView.animate(withDuration: duration, animations: {
            self.headerLabel.alpha = 0.0
        }, completion: {
            (Completed : Bool) -> Void in
            
            UIView.animate(withDuration: duration, delay: 0.7, options: UIView.AnimationOptions.curveLinear, animations: {
                self.headerLabel.text = "New Suggestions:"
                self.headerLabel.alpha = 1.0
            }, completion: nil)
        })
    }
}

