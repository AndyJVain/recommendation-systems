/*:
 ## Goal
 Learn how [recommendation systems](glossary://recommendation_systems) help you discover new digital content.
 
 ## Overview
 Have you ever wondered how Apple Music creates your New Music Mix each week with songs that are suited to your individual tastes? Or how the homepage of Netflix seems to always be updated with new shows and movies that look interesting to you?
 
 Recommendation systems are what make this possible. They are used to determine what you might want to watch, read, or listen to next.
 
 In order to learn more about how this works, let's take a look at an example of a music recommendation system.
 
 ## Task
 Rate several artists to see what might be recommended for you.
 
 - Tap once on the artists you like.
 - Press and hold on the ones you don't.
 
 When you're done, tap "Run My Code" to submit your ratings.
 
 */
//#-hidden-code
import PlaygroundSupport
import UIKit

// Determines when the page is successfully completed
func reportStatus() {
    for artist in artistNames {
        if let keyValue = PlaygroundKeyValueStore.current[artist.key],
            case .integer(let rating) = keyValue {
            if (rating == 1) {
                PlaygroundPage.current.assessmentStatus = .pass(message: "### Great!\nYour ratings have been submitted. [**Tap here**](@next) to go to the next page to see your recommendations.")
            }
        }
    }
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Please rate at least one artist."], solution: nil)
}
reportStatus()
//#-end-hidden-code
//#-code-completion(everything, hide)
