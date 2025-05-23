//
//  NewEnviornment.swift
//  BlackJack
//
//  Created by Frank Tagoe on 5/21/25.
//

import SwiftUI

struct NewEnviornment: View {
    @Binding var playerCredits: Int
    @Binding var CEnviornment: Color
    var body: some View{
        
        VStack{
           Text("Your Credits: \(playerCredits)")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .padding(.vertical, 20)
            HStack{
                VStack{
                    Text("Gold Background")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("200 Credits")
                    Button("Buy"){
                        if playerCredits < 200{
                           playerCredits = playerCredits
                        }else{
                            playerCredits -= 200
                            CEnviornment = .yellow
                        }
                    }
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 100, height: 45)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                   
                }
                VStack{
                    Text("Blue Background")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("500 Credits")
                    Button("Buy"){
                        if playerCredits < 500{
                           playerCredits = playerCredits
                        }else{
                            playerCredits -= 500
                            CEnviornment = .blue
                        }
                    }
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 100, height: 45)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                }
            }
            HStack{
                VStack{
                    Text("Purple Background")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("1000 Credits")
                        
                    Button("Buy"){
                        if playerCredits < 1000{
                           playerCredits = playerCredits
                        }else{
                            playerCredits -= 1000
                            CEnviornment = .purple
                        }
                    }
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 100, height: 45)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                }
                VStack{
                    Text("Red Background")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("3000 Credits")
                       
                    Button("Buy"){
                        if playerCredits < 3000{
                           playerCredits = playerCredits
                        }else{
                            playerCredits -= 3000
                            CEnviornment = .red
                        }
                    }
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 100, height: 45)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                }
              
            }
            Button("Back to Green"){
                
            }
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .padding()
            .frame(width: 170, height: 45)
            .background(Color.yellow)
            .foregroundColor(.black)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
            .padding(.vertical, 30)
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.white]),
                           center: .center,
                          startRadius: 900,
                          endRadius: 260)
        )
    }
}
