import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let label: String
    let suit: String
    let value: Int
}

struct Deck {
    static let cards: [Card] = {
        var cards = [Card]()
        let suits = ["♠︎", "♥︎", "♣︎", "♦︎"]
        let labels = [
            ("A", 1), ("2", 2), ("3", 3), ("4", 4),
            ("5", 5), ("6", 6), ("7", 7), ("8", 8),
            ("9", 9), ("10", 10), ("J", 10), ("Q", 10), ("K", 10)
        ]
        for suit in suits {
            for (label, value) in labels {
                cards.append(Card(label: label, suit: suit, value: value))
            }
        }
        return cards
    }()
}

