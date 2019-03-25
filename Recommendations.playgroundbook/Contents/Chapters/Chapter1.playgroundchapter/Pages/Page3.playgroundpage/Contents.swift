/*:
 ## Goal
 Learn about improved rating metrics and other recommendation systems.
 
 ## Limitations
 While a binary rating of "thumbs up" or "thumbs down" might be appropriate for some applications, it is not descriptive enough for others. In order to increase the accuracy of predictions, a user could express their preferences in a more precise way.
 
 ## Star Ratings
 A star rating system allows users to rate on a scale from 1-5 (with 5 being the highest). This type of rating scale can be used to rate many things, such as hotels, restaurants, and movies.
 
 ## Task
 Rate several movies to see what might be recommended for you.
 
 - Rather than rating movies using star buttons, let's submit our ratings using code!

 When you're done, tap "Run My Code" to submit your ratings.

 */
//#-hidden-code
import PlaygroundSupport
import UIKit

let vc = MovieViewController.loadFromStoryboard() as! MovieViewController
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = vc

//#-end-hidden-code
//#-code-completion(everything, hide)
// Enter your ratings below using numbers 1-5
let toyStoryRating = /*#-editable-code*/<#T##number of stars##Int#>/*#-end-editable-code*/
let theDarkKnightRating = /*#-editable-code*/<#T##number of stars##Int#>/*#-end-editable-code*/
let mrsDoubtfireRating = /*#-editable-code*/<#T##number of stars##Int#>/*#-end-editable-code*/
let loveActuallyRating = /*#-editable-code*/<#T##number of stars##Int#>/*#-end-editable-code*/
let theGodfatherRating = /*#-editable-code*/<#T##number of stars##Int#>/*#-end-editable-code*/
//#-hidden-code

func submitRatings() {
    let ratings = [Int(toyStoryRating),
                   Int(theDarkKnightRating),
                   Int(mrsDoubtfireRating),
                   Int(loveActuallyRating),
                   Int(theGodfatherRating)]
    vc.updateRatingLabels(usingRatings: ratings)
    PlaygroundKeyValueStore.current["Toy Story"] = .integer(toyStoryRating)
    PlaygroundKeyValueStore.current["The Dark Knight"] = .integer(theDarkKnightRating)
    PlaygroundKeyValueStore.current["Mrs. Doubtfire"] = .integer(mrsDoubtfireRating)
    PlaygroundKeyValueStore.current["Love Actually"] = .integer(loveActuallyRating)
    PlaygroundKeyValueStore.current["The Godfather"] = .integer(theGodfatherRating)
}

// Used to determine when the page is successfully completed
func reportStatus() {
    if (toyStoryRating >= 1 && toyStoryRating <= 5) {
        if (theDarkKnightRating >= 1 && theDarkKnightRating <= 5) {
            if (mrsDoubtfireRating >= 1 && mrsDoubtfireRating <= 5) {
                if (loveActuallyRating >= 1 && loveActuallyRating <= 5) {
                    if (theGodfatherRating >= 1 && theGodfatherRating <= 5) {
                        submitRatings()
                        PlaygroundPage.current.assessmentStatus = .pass(message: "### Awesome!\nYour ratings have been submitted. [**Tap here**](@next) to go to the next page to see your recommendations.")
                    } else {
                        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Oops, your rating for The Godfather isn't between 1 and 5."], solution: nil)
                    }
                } else {
                    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Oops, your rating for Love Actually isn't between 1 and 5."], solution: nil)
                }
            } else {
                PlaygroundPage.current.assessmentStatus = .fail(hints: ["Oops, your rating for Mrs. Doubtfire isn't between 1 and 5."], solution: nil)
            }
        } else {
            PlaygroundPage.current.assessmentStatus = .fail(hints: ["Oops, your rating for The Dark Knight isn't between 1 and 5."], solution: nil)
        }
    } else {
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Oops, your rating for Toy Story isn't between 1 and 5."], solution: nil)
    }
}
reportStatus()
//#-end-hidden-code
