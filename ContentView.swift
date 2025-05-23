import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.black.opacity(0.4), .clear, .black.opacity(0.4)]),
                    startPoint: .top,
                    endPoint: .bottom
                    )
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                        .frame(height: 60)
                    Text("♠︎ Blackjack ♣︎")
                        .font(.system(size: 50, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                        .shadow(color: .yellow.opacity(0.6), radius: 8)
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .frame(width: 120, height: 180)
                            .shadow(radius: 5)
                            .overlay(
                                VStack{
                                    HStack{
                                        Text("A")
                                            .font(.title)
                                            .bold()
                                        Spacer()
                                    }
                                    Spacer()
                                    Text("♠︎")
                                        .font(.system(size: 44))
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        Text("A")
                                            .font(.title)
                                            .bold()
                                    }
                                }
                                    .padding(10)
                                    .foregroundStyle(.black)
                            )
                            .rotationEffect(.degrees(-20))
                            .offset(x: -60)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .frame(width: 120, height: 180)
                            .shadow(radius: 5)
                            .overlay(
                                VStack{
                                    HStack{
                                        Text("K")
                                            .font(.title)
                                            .bold()
                                        Spacer()
                                    }
                                    Spacer()
                                    Text("♥︎")
                                        .font(.system(size: 44))
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        Text("K")
                                            .font(.title)
                                            .bold()
                                    }
                                }
                                    .padding(10)
                                    .foregroundStyle(.red)
                            )
                            .rotationEffect(.degrees(-5))
                            .offset(x: -15, y: -9)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .frame(width: 120, height: 180)
                            .shadow(radius: 5)
                            .overlay {
                                VStack{
                                    HStack{
                                        Text("Q")
                                            .font(.title)
                                            .bold()
                                        Spacer()
                                    }
                                    Spacer()
                                    Text("♦︎")
                                        .font(.system(size: 44))
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        Text("Q")
                                            .font(.title)
                                            .bold()
                                    }
                                }
                                .padding(10)
                                .foregroundStyle(.red)
                            }
                            .rotationEffect(.degrees(10))
                            .offset(x: 35, y: -5)
                    }
                    .padding(.bottom, 30)
                    
                    NavigationLink(destination: PlayPage()) {
                        Text("Play")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 180)
                            .background(
                                RadialGradient(gradient: Gradient(colors: [Color.red, Color.black]),
                                               center: .center,
                                              startRadius: 5,
                                              endRadius: 100)
                            )
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    }
                    Spacer()
                }
                .padding()
                
                Text("Play To Win, Stay For The Thrill!")
                    .font(.system(size: 25, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                    .shadow(color: .yellow.opacity(0.6), radius: 8)
                    .offset(x:0, y:200)
                Image("pokerchip")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .shadow(radius: 10)
               
                NavigationLink(destination: HowToPlayPage()) {
                    Text("How to Play")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.black.opacity(0.7))
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 5)
                        
                }
                .offset(x:0, y:250)
            }
        }
    }
}

