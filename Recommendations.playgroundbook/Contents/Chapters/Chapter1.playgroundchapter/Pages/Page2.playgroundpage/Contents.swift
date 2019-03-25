/*:
 ## Goal
 Learn about [collaborative filtering](glossary://collaborative_filtering) and [item-based](glossary://item_based) predictions.
 
 ## Collaborative Filtering
 Collaborative filtering is a recommendation technique that uses existing ratings to make suggestions for new content. Two kinds of collaborative filtering are: item-based and user-based.
 
 Our music recommendation system uses item-based collaborative filtering.
 
 ## Item-Based Process
 - A new user is prompted to indicate their existing music preferences.
 - The item-based recommendation algorithm then computes similarities between the rated artists and other artists.
 - The artists that are most similar will most likely align with the user's music preferences.
 
 ## Predictions
 By using the computed similarities, the recommendation system can make predictions on other artists that the user would like.
 
 Tap the "Run My Code" button to see your recommendations.
 
 */
//#-hidden-code
import PlaygroundSupport
import UIKit

class MessageHandler: PlaygroundRemoteLiveViewProxyDelegate {
    func remoteLiveViewProxy(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy, received message: PlaygroundValue) {
        print("Received a message from the always-on live view", message)
    }
    
    func remoteLiveViewProxyConnectionClosed(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy) {}
}

guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
    fatalError("Always-on live view not configured in this page's LiveView.swift.")
}
remoteView.delegate = MessageHandler()

// Send predictions
func generatePredictions() -> [PlaygroundValue]{
    var predictedArtists = [PlaygroundValue]()
    
    // Get the rated artists
    for artist in artistNames {
        if let keyValue = PlaygroundKeyValueStore.current[artist.key],
            case .integer(let rating) = keyValue {
            if (rating == 1) {
                // Randomly choose another artist in the same genre
                let genre = artist.value
                let possibleArtists = artistPredictions[genre]
                predictedArtists.append(.string(possibleArtists!.randomElement()!))
            }
        }
    }
    return predictedArtists
}
remoteView.send(PlaygroundValue.array(generatePredictions()))
PlaygroundPage.current.assessmentStatus = .pass(message: "### Nice Work!\nNow let's take a look at a different kind of recommendation system. [**Tap here**](@next) to see what's next.")
//#-end-hidden-code
//#-code-completion(everything, hide)
