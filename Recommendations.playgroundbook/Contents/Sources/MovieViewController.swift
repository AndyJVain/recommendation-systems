//
//  MovieViewController.swift
//  WWDC Scholarship 2019
//
//  Created by Andy Vainauskas on 3/22/19.
//  Copyright © 2019 Andy Vainauskas. All rights reserved.
//

import UIKit

public class MovieViewController: UIViewController {
    
    @IBOutlet weak var movie1StarLabel: UILabel!
    @IBOutlet weak var movie2StarLabel: UILabel!
    @IBOutlet weak var movie3StarLabel: UILabel!
    @IBOutlet weak var movie4StarLabel: UILabel!
    @IBOutlet weak var movie5StarLabel: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        movie1StarLabel.text = "🤔"
        movie2StarLabel.text = "🤔"
        movie3StarLabel.text = "🤔"
        movie4StarLabel.text = "🤔"
        movie5StarLabel.text = "🤔"
    }
    
    func createStarString(fromRating rating: Int) -> String {
        var starString = ""
        for _ in 0..<rating {
            starString.append("⭐️")
        }
        return starString
    }
    
    public func updateRatingLabels(usingRatings ratings: [Int]) {
        self.movie1StarLabel.text = self.createStarString(fromRating: ratings[0])
        self.movie2StarLabel.text = self.createStarString(fromRating: ratings[1])
        self.movie3StarLabel.text = self.createStarString(fromRating: ratings[2])
        self.movie4StarLabel.text = self.createStarString(fromRating: ratings[3])
        self.movie5StarLabel.text = self.createStarString(fromRating: ratings[4])
        
        self.movie1StarLabel.alpha = 0.0
        self.movie2StarLabel.alpha = 0.0
        self.movie3StarLabel.alpha = 0.0
        self.movie4StarLabel.alpha = 0.0
        self.movie5StarLabel.alpha = 0.0
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.movie1StarLabel.alpha = 1.0
            self.movie2StarLabel.alpha = 1.0
            self.movie3StarLabel.alpha = 1.0
            self.movie4StarLabel.alpha = 1.0
            self.movie5StarLabel.alpha = 1.0
        }, completion: nil)
    }
    
}

public extension MovieViewController {
    class func loadFromStoryboard() -> UIViewController? {
        let storyboard = UIStoryboard.init(name: "Movie", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MovieVC") as! MovieViewController
    }
}
