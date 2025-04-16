import SwiftUI

struct ContentView: View {
    @State var Cards : [String : Int] = ["Ace of Diamonds" : 1, "Two of Diamonds" : 2, "Three of Diamonds" : 3, "Four of Diamonds" : 4, "Five of Diamonds" : 5, "Six of Diamonds" : 6, "Seven of Diamonds": 7, "Eight of Diamonds" : 8, "Nine of Diamonds" : 9, "King of Diamonds" : 10, "Queen of Diamonds" : 10, "Jack of Diamonds" : 10, "Ace of Hearts" : 1, "Two of Hearts" : 2, "Three of Hearts" : 3, "Four of Hearts" : 4, "Five of Hearts" : 5, "Six of Hearts" : 6, "Seven of Hearts": 7, "Eight of Hearts" : 8, "Nine of Hearts" : 9, "King of Hearts" : 10, "Queen of Hearts" : 10, "Jack of Hearts" : 10, "Ace of Clubs" : 1, "Two of Clubs" : 2, "Three of Clubs" : 3, "Four of Clubs" : 4, "Five of Clubs" : 5, "Six of Clubs" : 6, "Seven of Clubs": 7, "Eight of Clubs" : 8, "Nine of Clubs" : 9, "King of Clubs" : 10, "Queen of Clubs" : 10, "Jack of Clubs" : 10  ]
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 150) {
                Spacer().frame(height: 100)
                
                Text("Blackjack")
                    .font(.system(size: 52, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 50)
                        .padding(.vertical, -95)
                    NavigationLink("Play"){
                        PlayPage()
                    }
                    .padding(.vertical, -90)
                    .foregroundStyle(.black)
                    .font(.system(size:35, weight: .bold, design: .rounded))
                    
                }
                
                
                
                
                
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .frame(width: 140, height: 200)
                            .shadow(radius: 10)
                            .overlay(
                                VStack {
                                    HStack {
                                        Text("A")
                                            .font(.largeTitle)
                                            .bold()
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                    .padding(14)
                                    .foregroundColor(.black)
                            )
                            .rotationEffect(.degrees(-15))
                            .offset(x: -40)
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .frame(width: 140, height: 200)
                            .shadow(radius: 10)
                            .overlay(
                                VStack {
                                    HStack {
                                        Text("K")
                                            .font(.largeTitle)
                                            .bold()
                                        Spacer()
                                    }
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Text("♣︎")
                                            .font(.title)
                                    }
                                }
                                    .padding(14)
                                    .foregroundColor(.black)
                            )
                            .rotationEffect(.degrees(15))
                            .offset(x: 40)
                    }
                    Spacer()
                }
            }
        }
    

