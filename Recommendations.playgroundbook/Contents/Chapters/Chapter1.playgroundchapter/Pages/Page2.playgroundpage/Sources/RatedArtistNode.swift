//
//  RatedArtistNode.swift
//  WWDC Scholarship 2019
//
//  Created by Andy Vainauskas on 3/21/19.
//  Copyright (c) 2019 Andy Vainauskas. All rights reserved.
//

import PlaygroundSupport
import Foundation
import UIKit
import SpriteKit

class RatedArtistNode: SIFloatingNode {
    var labelNode = SKLabelNode(fontNamed: "")
    
    class func instantiate(title: String) -> RatedArtistNode {
        let node = RatedArtistNode(circleOfRadius: artistBubbleRadius)
        configure(node: node, withTitle: title)
        return node
    }
    
    class func configure(node: RatedArtistNode, withTitle title: String) {
        let boundingBox = node.path?.boundingBox;
        let radius = (boundingBox?.size.width)! / 2.0;
        node.physicsBody = SKPhysicsBody(circleOfRadius: radius + 1.5)
        node.fillColor = UIColor.artistBubbleColor
        node.strokeColor = node.fillColor
        
        let attrString = artistLabelText(withString: title)
        node.labelNode.attributedText = attrString
        
        node.name = title
        node.labelNode.numberOfLines = 0
        node.labelNode.preferredMaxLayoutWidth = node.frame.width - 20
        node.labelNode.position = CGPoint.zero
        node.labelNode.isUserInteractionEnabled = false
        node.labelNode.verticalAlignmentMode = .center
        node.labelNode.horizontalAlignmentMode = .center
        node.addChild(node.labelNode)
    }
    
    override func selectAnimation() -> SKAction? {
        return SKAction.scale(to: 1, duration: 0.2)
    }
    
    override func normalizeAnimation() -> SKAction? {
        return SKAction.scale(to: 1, duration: 0.2)
    }
    
    override func removeAnimation() -> SKAction? {
        return SKAction.scale(to: 1, duration: 0.2)
    }
    
    func `throw`(to point: CGPoint, completion block: @escaping (() -> Void)) {
        removeAllActions()
        let movingXAction = SKAction.moveTo(x: point.x, duration: 0.2)
        let movingYAction = SKAction.moveTo(y: point.y, duration: 0.4)
        let resize = SKAction.scale(to: 0.3, duration: 0.4)
        let throwAction = SKAction.group([movingXAction, movingYAction, resize])
        run(throwAction, completion: block)
    }
    
    // Returns an NSAttributedString formatted to be used for the ArtistNode's label
    class func artistLabelText(withString artist: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: artistBubbleFontSize)
        ]
        let attrString = NSAttributedString(string: artist, attributes: attributes)
        return attrString
    }
}
