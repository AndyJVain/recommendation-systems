//
//  Constants+Extensions.swift
//  WWDC Scholarship 2019
//
//  Created by Andy Vainauskas on 3/21/19.
//  Copyright (c) 2019 Andy Vainauskas. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    public static let artistBubbleColor = UIColor(red: 252/255, green: 49/255, blue: 89/255, alpha: 1.0)
}

public let artistBubbleRadius: CGFloat = 50
public let artistBubbleFontSize: CGFloat = 16

public let artistNames: [String : Genre] = ["Queen" : .rock,
                                            "U2" : .rock,
                                            "Drake" : .rb,
                                            "Alicia Keys" : .rb,
                                            "Imagine Dragons" : .pop,
                                            "Ariana Grande" : .pop,
                                            "Coldplay" : .alternative,
                                            "Foo Fighters" : .alternative,
                                            "Metallica" : .metal,
                                            "Iron Maiden" : .metal,
                                            "Miranda Lambert" : .country,
                                            "Blake Shelton" : .country,
                                            "ODESZA" : .edm,
                                            "Daft Punk" : .edm,
                                            "Miles Davis" : .jazz,
                                            "Charlie Parker" : .jazz,
                                            "Mozart" : .classical,
                                            "Hanz Zimmer" : .classical
                                            ]

public let artistPredictions: [Genre : [String]] = [.rock : ["The Beatles", "Aerosmith", "The Doors", "Linkin Park", "The Rolling Stones"],
                                                    .rb : ["The Weeknd", "Jay-Z", "Ne-Yo", "Childish Gambino", "Mariah Carey"],
                                                    .pop : ["Lady Gaga", "P!nk", "Maroon 5", "Selena Gomez", "Panic!"],
                                                    .alternative : ["Mumford & Sons", "The Black Keys", "Arctic Monkeys", "Cage The Elephant", "Tame Impala"],
                                                    .metal : ["Slipknot", "Judas Priest", "Korn", "Megadeth", "Disturbed"],
                                                    .country : ["Keith Urban", "Sugarland", "Rascal Flatts", "Chris Stapleton", "Luke Bryan"],
                                                    .edm : ["Calvin Harris", "Kygo", "Avicii", "Zedd", "Illenium"],
                                                    .jazz : ["John Coltrane", "Tony Bennett", "Diana Krall", "Van Morrison", "Herb Alpert"],
                                                    .classical : ["Yo-Yo Ma", "Joshua Bell", "Philip Glass", "Aaron Copland", "John Williams"]
                                                    ]
