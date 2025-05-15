import SwiftUI
//import Foundation
//import AVFoundation



class AudioManager: ObservableObject {
//    var player: AVAudioPlayer?
    
    
//    func playSound(named soundName: String) {
//        if let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
//            do {
//                player = try AVAudioPlayer(contentsOf: url)
//                player?.play()
//            } catch {
//                print("Error playing sound: \(error.localizedDescription)")
//            }
//        }
//    }
}
        struct PlayPage: View {
            @State var gameStarted = false
            @State var gameOver = false
            @State var resultMessage = ""
            @State var playerCards: [Card] = []
            @State var dealerCard: Card? = nil
            @State var ComputerScore: Int = 0
            @State var newComputerScore = 0
            @State var cardNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ,11]
            @State var playerCredits: Int = 3000
            @State var currentBet: Int = 100

            
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
                    VStack(spacing: 10) {
                        HStack {
                            Text("Credits: \(playerCredits)")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .padding(.leading)
                            Stepper("Change Bet:", value: $currentBet, in: 0...5000, step: 10)
                                .frame(width: 200, height: 10, alignment: .top)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .disabled(gameStarted && !gameOver)
                                .opacity((gameStarted && !gameOver) ? 0.3 : 1.0)
                            Spacer()
                            Text("Bet: \(currentBet)")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .padding(.trailing)
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: .infinity, height: 50, alignment: .top)
                  
              
                    
                        
                    
                    
                    
                    if gameStarted && !gameOver {
                        VStack(spacing: 20) {
                            Text("Your Score: \(playerScore)")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                            Text("Dealer Score: \(ComputerScore)")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                          
                            if let card = dealerCard {
                                ShowCard(card: card)
                                    .offset(x:0 , y: -100)
                            }
                               
                            
                            HStack(spacing: -15) {
                                ForEach(playerCards) { card in
                                    ShowCard(card: card)
                                }
                            }
                           
                                ZStack{
                                    Rectangle()
                                        .frame(width: .infinity, height: 170, alignment: .bottom)
                                        .foregroundStyle(
                                            RadialGradient(gradient: Gradient(colors: [Color.black, Color.brown]),
                                                           center: .center,
                                                          startRadius:500,endRadius: 135)
                                        )
                                        .offset(x: 0,y: 100)
                                    HStack{
                                        Button("Hit") {
                                            hit()
                                        }
                                        .font(.system(size: 25, weight: .bold, design: .rounded))
                                        .padding()
                                        .background(Color(red: 0.9, green: 0.7, blue: 0.0, opacity: 1.0))
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                        .offset(x: 0,y: 100)
                                        Button("Stand"){
                                            stand()
                                            checkForDealerBust()
                                        }
                                        .font(.system(size: 25, weight: .bold, design: .rounded))
                                        .padding()
                                        .background(Color(red: 0.9, green: 0.7, blue: 0.0, opacity: 1.0))
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                        .offset(x: 0,y: 100)
                                        Button("Double") {
                                            doubleDown()
                                        }
                                        .font(.system(size: 25, weight: .bold, design: .rounded))
                                        .padding()
                                        .background(Color(red: 0.9, green: 0.3, blue: 0.0, opacity: 1.0))
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                        .offset(x: 0, y: 100)
                                    }
                                    
                                
                                
                                
                            }
                            
                        }
                        
                    }
                    
                    if !gameStarted {
                        HStack{
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(.white)
                                    .frame(width: 100, height: 145)
                                    .shadow(radius: 4)
                                Text("3")
                                    .frame(width: 70, height: 140, alignment: .topTrailing)
                                    .foregroundStyle(.black)
                                Text("♣︎")
                                    .frame(width: 70, height: 100, alignment: .topTrailing)
                                    .foregroundStyle(.black)
                                Text("♣︎")
                                    .frame(width: 70, height: 100, alignment: .bottomLeading)
                                    .foregroundStyle(.black)
                                Text("♣︎")
                                    .font(.largeTitle)
                                    .frame(width: 30, height: 40, alignment: .bottomLeading)
                                    .foregroundStyle(.black)
                            }
                            .rotationEffect(Angle(degrees: 9))
                            .padding(.vertical, 20)
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(.white)
                                    .frame(width: 100, height: 145)
                                    .shadow(radius: 4)
                                Text("2")
                                    .frame(width: 70, height: 140, alignment: .topTrailing)
                                    .foregroundStyle(.black)
                                Text("♠︎")
                                    .frame(width: 70, height: 100, alignment: .topTrailing)
                                    .foregroundStyle(.black)
                                Text("♠︎")
                                    .frame(width: 70, height: 100, alignment: .bottomLeading)
                                    .foregroundStyle(.black)
                                Text("♠︎")
                                    .font(.largeTitle)
                                    .frame(width: 30, height: 40, alignment: .bottomLeading)
                                    .foregroundStyle(.black)
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(.white)
                                    .frame(width: 100, height: 145)
                                    .shadow(radius: 4)
                                Text("4")
                                    .frame(width: 70, height: 140, alignment: .topTrailing)
                                    .foregroundStyle(.black)
                                Text("♣︎")
                                    .frame(width: 70, height: 100, alignment: .topTrailing)
                                    .foregroundStyle(.black)
                                Text("♣︎")
                                    .frame(width: 70, height: 100, alignment: .bottomLeading)
                                    .foregroundStyle(.black)
                                Text("♣︎")
                                    .font(.largeTitle)
                                    .frame(width: 30, height: 40, alignment: .bottomLeading)
                                    .foregroundStyle(.black)
                            }
                            .rotationEffect(Angle(degrees: -9))
                            .padding(.vertical, 20)
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(.white)
                                    .frame(width: 100, height: 145)
                                    .shadow(radius: 4)
                                Text("4")
                                    .frame(width: 70, height: 140, alignment: .topTrailing)
                                    .foregroundStyle(.black)
                                Text("♠︎")
                                    .frame(width: 70, height: 100, alignment: .topTrailing)
                                    .foregroundStyle(.black)
                                Text("♠︎")
                                    .frame(width: 70, height: 100, alignment: .bottomLeading)
                                    .foregroundStyle(.black)
                                Text("♠︎")
                                    .font(.largeTitle)
                                    .frame(width: 30, height: 40, alignment: .bottomLeading)
                                    .foregroundStyle(.black)
                            }
                        }
                        .border(Color(red: 0.0, green: 0.6, blue: 0.2, opacity: 0.5), width: 4)
                        Button(action: {
                                   withAnimation(.easeInOut(duration: 0.5)) {
                                       startGame()
                                   }
                               }) {
                                   Text("Play Game")
                                       .font(.system(size: 24, weight: .bold, design: .rounded))
                                       .padding()
                                       .frame(width: 220)
                                       .background(Color.yellow)
                                       .foregroundColor(.black)
                                       .cornerRadius(16)
                                       .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                                       .scaleEffect(gameStarted ? 1.0 : 1.1)
                               }
                        VStack{
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.white)
                                        .frame(width: 100, height: 145)
                                        .shadow(radius: 4)
                                    Text("8")
                                        .frame(width: 70, height: 140, alignment: .topTrailing)
                                        .foregroundStyle(.red)
                                    Text("♦︎")
                                        .frame(width: 70, height: 100, alignment: .topTrailing)
                                        .foregroundStyle(.red)
                                    Text("♦︎")
                                        .frame(width: 70, height: 100, alignment: .bottomLeading)
                                        .foregroundStyle(.red)
                                    Text("♦︎")
                                        .font(.largeTitle)
                                        .frame(width: 30, height: 40, alignment: .bottomLeading)
                                        .foregroundStyle(.red)
                                }
                                .rotationEffect(Angle(degrees: -9))
                                .padding(.vertical, 20)
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.white)
                                        .frame(width: 100, height: 145)
                                        .shadow(radius: 4)
                                    Text("3")
                                        .frame(width: 70, height: 140, alignment: .topTrailing)
                                        .foregroundStyle(.red)
                                    Text("♥︎")
                                        .frame(width: 70, height: 100, alignment: .topTrailing)
                                        .foregroundStyle(.red)
                                    Text("♥︎")
                                        .frame(width: 70, height: 100, alignment: .bottomLeading)
                                        .foregroundStyle(.red)
                                    Text("♥︎")
                                        .font(.largeTitle)
                                        .frame(width: 30, height: 40, alignment: .bottomLeading)
                                        .foregroundStyle(.red)
                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.white)
                                        .frame(width: 100, height: 145)
                                        .shadow(radius: 4)
                                    Text("9")
                                        .frame(width: 70, height: 140, alignment: .topTrailing)
                                        .foregroundStyle(.red)
                                    Text("♦︎")
                                        .frame(width: 70, height: 100, alignment: .topTrailing)
                                        .foregroundStyle(.red)
                                    Text("♦︎")
                                        .frame(width: 70, height: 100, alignment: .bottomLeading)
                                        .foregroundStyle(.red)
                                    Text("♦︎")
                                        .font(.largeTitle)
                                        .frame(width: 30, height: 40, alignment: .bottomLeading)
                                        .foregroundStyle(.red)
                                }
                                .rotationEffect(Angle(degrees: 9))
                                .padding(.vertical, 20)
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.white)
                                        .frame(width: 100, height: 145)
                                        .shadow(radius: 4)
                                    Text("6")
                                        .frame(width: 70, height: 140, alignment: .topTrailing)
                                        .foregroundStyle(.red)
                                    Text("♥︎")
                                        .frame(width: 70, height: 100, alignment: .topTrailing)
                                        .foregroundStyle(.red)
                                    Text("♥︎")
                                        .frame(width: 70, height: 100, alignment: .bottomLeading)
                                        .foregroundStyle(.red)
                                    Text("♥︎")
                                        .font(.largeTitle)
                                        .frame(width: 30, height: 40, alignment: .bottomLeading)
                                        .foregroundStyle(.red)
                                }
                                
                            }
                        
                            
                        }
                        .border(Color(red: 0.0, green: 0.6, blue: 0.2, opacity: 0.5), width: 4)
                        
                    }
                    
                    if gameOver {
                        Text(resultMessage)
                            .font(.title2)
                            .foregroundColor(.red)
                        
                        Button("Play Again") {
                            startGame()
                            
                            
                        }
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 142)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                    }
                    
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RadialGradient(gradient: Gradient(colors: [Color.black, Color.green]),
                                   center: .center,
                                  startRadius: 700,
                                  endRadius: 260)
                )

                .border(Color(red: 1.0, green: 0.2, blue: 0.2, opacity: 0.0), width: 7)
                
                
                
            }
        
            
            func doubleDown() {
                if playerCredits >= currentBet {
                    playerCredits -= currentBet
                    currentBet *= 2
                    playerCards.append(drawCard())
                    
                    if playerScore > 21 {
                        resultMessage = "You busted after doubling! Score: \(playerScore)"
                        gameOver = true
                    } else {
                        stand()
                    }
                } else {
                    resultMessage = "Not enough credits to double down!"
                }
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
                    playerCredits -= currentBet
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
                    if ComputerScore < 17 {
                        ComputerScore += drawCard().value
                    }
                    if ComputerScore > 21 {
                        resultMessage = "Dealer busted, You Win! Score: \(playerScore)"
                        playerCredits += currentBet
                    } else if ComputerScore > playerScore {
                        resultMessage = "Dealer wins with \(ComputerScore)"
                        playerCredits -= currentBet
                    } else if ComputerScore == playerScore {
                        resultMessage = "Push"
                    } else {
                        resultMessage = "You win! Dealer had \(ComputerScore)"
                        playerCredits += currentBet
                    }
                gameOver = true
                
            }
            
            
            func startGame() {
                gameStarted = true
                gameOver = false
                resultMessage = ""
                playerCards = [drawCard(), drawCard()]
                let drawnCard = drawCard()
                dealerCard = drawnCard
                ComputerScore = drawnCard.value
                
            }
            
            func drawCard() -> Card {
                Deck.cards.randomElement()!
            }
        }
        
    

