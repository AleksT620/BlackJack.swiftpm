import SwiftUI

struct ContentView: View {
    @State var Cards : [String : Int] = ["Ace of Diamonds" : 1, "Two of Diamonds" : 2, "Three of Diamonds" : 3, "Four of Diamonds" : 4, "Five of Diamonds" : 5, "Six of Diamonds" : 6, "Seven of Diamonds": 7, "Eight of Diamonds" : 8, "Nine of Diamonds" : 9, "King of Diamonds" : 10, "Queen of Diamonds" : 10, "Jack of Diamonds" : 10 ]
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 150) {
                Spacer().frame(height: 100)
                
                Text("Blackjack")
                    .font(.system(size: 52, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                ZStack {
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
}
