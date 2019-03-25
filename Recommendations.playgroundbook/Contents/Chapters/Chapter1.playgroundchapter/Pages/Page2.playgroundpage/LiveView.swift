import PlaygroundSupport
import UIKit

extension RatedArtistViewController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        var predictedNames = [String]()
        
        if message != nil, case .array(let m) = message {
            for artist in m {
                if artist != nil, case .string(let result) = artist {
                    predictedNames.append(result)
                }
            }
        }
        self.updateNodes(withNames: predictedNames)
        self.updateHeader()
    }
}

PlaygroundPage.current.liveView = RatedArtistViewController()
