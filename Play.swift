import SwiftUI

struct PlayPage: View {
    @State var gameStarted = false
    @State var gameOver = false
    @State var resultMessage = ""
    @State private var playerCards: [Int] = []

    var playerScore: Int {
        playerCards.reduce(0, +)
    }

    var body: some View {
        VStack {
            if gameStarted && !gameOver {
                VStack(spacing: 20) {
                    Text("Score: \(playerScore)")
                        .font(.title)
                    
                    Button("Hit") {
                        hit()
                    }
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
            }
            
            if !gameStarted {
                Button("Start Game") {
                    startGame()
                }
                .font(.title2)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            
            if gameOver {
                Text(resultMessage)
                    .font(.title2)
                    .foregroundColor(.red)
                
                Button("Play Again") {
                    startGame()
                }
                .font(.title2)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
        }
    }

    func hit() {
        playerCards.append(drawCard())
        checkForBust()
    }

    func checkForBust() {
        if playerScore > 21 {
            resultMessage = "You busted! Score: \(playerScore)"
            gameOver = true
        }
    }

    func startGame() {
        gameStarted = true
        gameOver = false
        resultMessage = ""
        playerCards = [drawCard(), drawCard()]
    }

    func drawCard() -> Int {
        Int.random(in: 2...11)
    }
}
