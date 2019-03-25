/*:
 ## Goal
 Learn about [user-based](glossary://user_based) predictions.
 
 ## User-Based Process
 Our movie recommendation system uses user-based collaborative filtering.

 - A new user is prompted to rate several movies.
 - The user-based recommendation algorithm then computes similarities between the ratings of the new user and other users.
 - Other users with similar ratings most likely have the same taste in movies.
 
 ## Predictions
 The "other rating" category is from a different user, and their ratings are relatively close to yours. This means that if they rated a movie that you haven't, their rating can be used as a prediction.
 
 Tap the "Run My Code" button to see your movie prediction.
 
 */

//#-hidden-code
import PlaygroundSupport
import UIKit

let vc = MoviePredictionViewController.loadFromStoryboard() as! MoviePredictionViewController
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = vc

vc.makePrediction()
PlaygroundPage.current.assessmentStatus = .pass(message: "### Congrats!\nYou just learned the basics of recommendation systems. Thank you for checking out my Playground Book!")
//#-end-hidden-code
//#-code-completion(everything, hide)
