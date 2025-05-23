//
//  NewEnviornment.swift
//  BlackJack
//
//  Created by Frank Tagoe on 5/21/25.
//

import SwiftUI

struct NewEnviornment: View {
    @Binding var playerCredits: Int
    var body: some View{
        
        VStack{
            HStack{
                VStack{
                    Text("Red Background")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 50)
                  
                    Text("Buy")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                }
                VStack{
                    Text("Blue Background")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 50)
                    Text("Buy")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 100, height: 50)
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
                        .padding(.vertical, 50)
                    Text("Buy")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                }
                VStack{
                    Text("Gold Background")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 50)
                    Text("Buy")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                }
            }
           
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
