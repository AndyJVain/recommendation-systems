//
//  MoviePredictionViewController.swift
//  WWDC Scholarship 2019
//
//  Created by Andy Vainauskas on 3/22/19.
//  Copyright © 2019 Andy Vainauskas. All rights reserved.
//

import UIKit
import PlaygroundSupport

public class MoviePredictionViewController: UIViewController {
    
    @IBOutlet weak var otherMovie1RatingLabel: UILabel!
    @IBOutlet weak var otherMovie2RatingLabel: UILabel!
    @IBOutlet weak var otherMovie3RatingLabel: UILabel!
    @IBOutlet weak var otherMovie4RatingLabel: UILabel!
    @IBOutlet weak var otherMovie5RatingLabel: UILabel!
    @IBOutlet weak var yourMovie1RatingLabel: UILabel!
    @IBOutlet weak var yourMovie2RatingLabel: UILabel!
    @IBOutlet weak var yourMovie3RatingLabel: UILabel!
    @IBOutlet weak var yourMovie4RatingLabel: UILabel!
    @IBOutlet weak var yourMovie5RatingLabel: UILabel!
    
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var otherPredictionRatingLabel: UILabel!
    @IBOutlet weak var yourPredictionRatingLabel: UILabel!
    
    var movie1Rating = 0
    var movie2Rating = 0
    var movie3Rating = 0
    var movie4Rating = 0
    var movie5Rating = 0
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.otherMovie1RatingLabel.text = ""
        self.otherMovie2RatingLabel.text = ""
        self.otherMovie3RatingLabel.text = ""
        self.otherMovie4RatingLabel.text = ""
        self.otherMovie5RatingLabel.text = ""
        
        self.yourMovie1RatingLabel.text = ""
        self.yourMovie2RatingLabel.text = ""
        self.yourMovie3RatingLabel.text = ""
        self.yourMovie4RatingLabel.text = ""
        self.yourMovie5RatingLabel.text = ""
        
        self.predictionLabel.text = ""
        self.otherPredictionRatingLabel.text = ""
        self.yourPredictionRatingLabel.text = ""
        
        self.loadInitialRatings()
    }
    
    func createStarString(fromRating rating: Int) -> String {
        var starString = ""
        for _ in 0..<rating {
            starString.append("⭐️")
        }
        return starString
    }
    
    func loadInitialRatings() {
        if let keyValue = PlaygroundKeyValueStore.current["Toy Story"],
            case .integer(let rating1) = keyValue {
            self.movie1Rating = rating1
            self.yourMovie1RatingLabel.text = self.createStarString(fromRating: rating1)
            
            if (rating1 != 5) {
                self.otherMovie1RatingLabel.text = self.createStarString(fromRating: rating1+1)
            } else {
                self.otherMovie1RatingLabel.text = self.createStarString(fromRating: rating1-1)
            }
        }
        if let keyValue = PlaygroundKeyValueStore.current["The Dark Knight"],
            case .integer(let rating2) = keyValue {
            self.movie2Rating = rating2
            self.yourMovie2RatingLabel.text = self.createStarString(fromRating: rating2)
            self.otherMovie2RatingLabel.text = self.createStarString(fromRating: rating2)
        }
        if let keyValue = PlaygroundKeyValueStore.current["Mrs. Doubtfire"],
            case .integer(let rating3) = keyValue {
            self.movie3Rating = rating3
            self.yourMovie3RatingLabel.text = self.createStarString(fromRating: rating3)
            self.otherMovie3RatingLabel.text = self.createStarString(fromRating: rating3)
        }
        if let keyValue = PlaygroundKeyValueStore.current["Love Actually"],
            case .integer(let rating4) = keyValue {
            self.movie4Rating = rating4
            self.yourMovie4RatingLabel.text = self.createStarString(fromRating: rating4)
            
            if (rating4 != 1) {
                self.otherMovie4RatingLabel.text = self.createStarString(fromRating: rating4-1)
            } else {
                self.otherMovie4RatingLabel.text = self.createStarString(fromRating: rating4+1)
            }
        }
        if let keyValue = PlaygroundKeyValueStore.current["The Godfather"],
            case .integer(let rating5) = keyValue {
            self.movie5Rating = rating5
            self.yourMovie5RatingLabel.text = self.createStarString(fromRating: rating5)
            self.otherMovie5RatingLabel.text = self.createStarString(fromRating: rating5)
        }
    }
    
    public func makePrediction() {
        let animatedMovies = ["The Incredibles", "Shrek", "Monsters, Inc", "Inside Out", "Finding Nemo"]
        let actionMovies = ["The Avengers", "The Last Jedi", "Skyfall", "The Terminator", "Die Hard"]
        let comedyMovies = ["Deadpool", "Anchorman", "Groundhog Day", "Airplane!", "Caddyshack"]
        let romanticMovies = ["La La Land", "The Notebook", "Titanic", "The Proposal", "The Holiday"]
        let dramaMovies = ["The Help", "The Hurt Locker", "Gladiator", "A Beautiful Mind", "First Man"]
        
        // Find highest rating
        let ratings = [movie1Rating, movie2Rating, movie3Rating, movie4Rating, movie5Rating]
        var max = 0
        var maxIndex = 0
        for (i, rating) in ratings.enumerated() {
            if (rating > max) {
                max = rating
                maxIndex = i
            }
        }

        switch maxIndex {
        case 0:
            predictionLabel.text = "\(animatedMovies.randomElement()!)"
            otherPredictionRatingLabel.text = "\(self.createStarString(fromRating: max))"
            yourPredictionRatingLabel.text = "\(self.createStarString(fromRating: max))"
        case 1:
            predictionLabel.text = "\(actionMovies.randomElement()!)"
            otherPredictionRatingLabel.text = "\(self.createStarString(fromRating: max))"
            yourPredictionRatingLabel.text = "\(self.createStarString(fromRating: max))"
        case 2:
            predictionLabel.text = "\(comedyMovies.randomElement()!)"
            otherPredictionRatingLabel.text = "\(self.createStarString(fromRating: max))"
            yourPredictionRatingLabel.text = "\(self.createStarString(fromRating: max))"
        case 3:
            predictionLabel.text = "\(romanticMovies.randomElement()!)"
            otherPredictionRatingLabel.text = "\(self.createStarString(fromRating: max))"
            yourPredictionRatingLabel.text = "\(self.createStarString(fromRating: max))"
        case 4:
            predictionLabel.text = "\(dramaMovies.randomElement()!)"
            otherPredictionRatingLabel.text = "\(self.createStarString(fromRating: max))"
            yourPredictionRatingLabel.text = "\(self.createStarString(fromRating: max))"
        default:
            break
        }
        
        predictionLabel.alpha = 0.0
        otherPredictionRatingLabel.alpha = 0.0
        yourPredictionRatingLabel.alpha = 0.0
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.predictionLabel.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 1.0, delay: 1.0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.otherPredictionRatingLabel.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 1.0, delay: 2.0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.yourPredictionRatingLabel.alpha = 1.0
        }, completion: nil)
        
    }
    
    public func updateRatingLabels(usingRatings ratings: [Int]) {
        
        UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
            
        }, completion: nil)
    }
    
}

public extension MoviePredictionViewController {
    class func loadFromStoryboard() -> UIViewController? {
        let storyboard = UIStoryboard.init(name: "MoviePrediction", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MoviePredictionVC") as! MoviePredictionViewController
    }
}
