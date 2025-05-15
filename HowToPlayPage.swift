//
//  File.swift
//  BlackJack
//
//  Created by Spencer I. Fung on 5/15/25.
//

import SwiftUI

struct HowToPlayPage: View {
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.black.opacity(0.7), .gray.opacity(0.6)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("How to Play")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Goal of the Game")
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                        Text("Try to get as close to 21 as possible without going over. Beat the dealer’s hand to win.")
                            .foregroundStyle(.white.opacity(0.9))
                        
                        Text("Card Values")
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                        Text("""
                                    • Number cards are worth their face value.
                                    • Face cards (K, Q, J) are worth 10.
                                    • Aces are worth 1 or 11, whichever is better.
                                    """)
                        .foregroundStyle(.white.opacity(0.9))
                        
                        Text("Game Play")
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                        Text("""
                                    1. You and the dealer are both dealt two cards.
                                    2. You can choose to 'Hit' to draw another card.
                                    3. You can choose to 'Stand' to hold your total.
                                    4. Dealer plays after you.
                                    5. Whoever is closest to 21 without busting wins.
                                    """)
                        .foregroundStyle(.white.opacity(0.9))
                        
                        Text("Bust")
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                        Text("Going over 21 means an automatic loss!")
                            .foregroundStyle(.white.opacity(0.9))
                    }
                    .padding()
                }
                
                Spacer()
            }
            .padding()
        }
            }
}


