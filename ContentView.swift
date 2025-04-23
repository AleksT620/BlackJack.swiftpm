import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
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
                        .offset(x: 40,y: -350)
                }
                Spacer()
            }
        }
    }
}
