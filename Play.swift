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
        var total = 0
        var acecount = 0
        for card in playerCards{
            total += card.value
            if card.label == "A" {
                acecount += 1
            }
        }
        if acecount > 0 && total + 10 <= 21 {
            total += 10
        }
        return total
    }
    
    var body: some View {
        VStack{
           
            if gameStarted && !gameOver {
                VStack(spacing: 20) {
                    Text("Your Score: \(playerScore)")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    Text("Dealer Score: \(ComputerScore)")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    HStack(spacing: -15) {
                        ForEach(playerCards) { card in
                            ShowCard(card: card)
                        }
                    }
                    
                    ZStack{
                        Rectangle()
                            .frame(width: .infinity, height: 170, alignment: .bottom)
                            .foregroundStyle(.brown)
                        VStack{
                            Button("Hit") {
                                hit()
                            }
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            Button("Stand"){
                                stand()
                                checkForDealerBust()
                            }
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                        
                    }
                }
               
            }
            
            if !gameStarted {
                Button("Start Game") {
                    startGame()
               
                }
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
                .background(Color.white)
                .foregroundColor(.black)
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
      
            
            
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
        .border(Color(red: 1.0, green: 0.2, blue: 0.2, opacity: 0.0), width: 7)
        
        
        
    }
    func hit() {
        playerCards.append(drawCard())
        checkForBust()
    }
    func checkForDealerBust() {
        
        if ComputerScore > 21 {
            resultMessage = "Dealer busted, You Win! Score: \(playerScore)";
            gameOver = true
        }
    }
    
    
    func checkForBust() {
        
        if playerScore > 21 {
            resultMessage = "You busted! Score: \(playerScore)";
            gameOver = true
        }
    }
    
    func stand(){
        if ComputerScore < 17 {
            ComputerScore += drawCard().value
        }
        if ComputerScore < 17 {
            ComputerScore += drawCard().value
        }
        if ComputerScore < 17 {
            ComputerScore += drawCard().value
        }
        if ComputerScore > 21 {
            resultMessage = "Dealer Busted, You Win! Score: \(playerScore)"
        }else if ComputerScore > playerScore {
            resultMessage = "Dealer wins with \(ComputerScore)"
        }else if ComputerScore == playerScore {
            resultMessage = "Push"
        }else {
            resultMessage = "You Win! Dealer had \(ComputerScore)"
        }
        gameOver = true
    }
    
    func startGame() {
           gameStarted = true
           gameOver = false
           resultMessage = ""
           playerCards = [drawCard(), drawCard()]
        ComputerScore = drawCard().value
       }
    
    func drawCard() -> Card {
        Deck.cards.randomElement()!
    }
}

