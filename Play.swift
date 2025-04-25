import SwiftUI

struct PlayPage: View {
    @State var gameStarted = false
    @State var gameOver = false
    @State var resultMessage = ""
    @State var playerCards: [Card] = []
    @State var ComputerScore: Int = 0
    @State var newComputerScore = 0
    @State var cardNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ,11]
    
    var playerScore: Int {
        playerCards.reduce(0) { $0 + $1.value }
    }
    
    var body: some View {
        VStack{
            Button("Stand"){
                stand()
            }
            if gameStarted && !gameOver {
                VStack(spacing: 20) {
                    Text("Score: \(playerScore)")
                        .font(.title)
                    HStack(spacing: 10){
                        ForEach(playerCards) { card in
                            ShowCard(card: card)
                        }
                    }
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
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            Text("Computer Score: \(ComputerScore)")
                .font(.title)
            
        }
    }
    func hit() {
        playerCards.append(drawCard())
        checkForBust()
    }
    func checkForBust() {
        
        if playerScore > 21 {
            resultMessage = "You busted! Score: \(playerScore)";
            gameOver = true
        }
    }
    
    func stand(){
        if ComputerScore < 21 {
            ComputerScore = ComputerScore + (cardNumbers.randomElement() ?? 0)
        }
    }
    
    func startGame() {
           gameStarted = true
           gameOver = false
           resultMessage = ""
           playerCards = [drawCard(), drawCard()]
       }
    
    func drawCard() -> Card {
        Deck.cards.randomElement()!
    }
}

