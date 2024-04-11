//
//  winView.swift
//  MineSweeper
//
//  Created by Jasper Katalevsky on 4/10/24.
//

import SwiftUI

struct winView: View {
    var body: some View {
        VStack
        {
            Spacer()
            Text("You Win")
                .font(.title)
            Spacer()
            
            VStack
            {
                HStack
                {
                    Spacer()
                    
                    Text("Bombs Found: ")
                        .font(.title2)
                     
                    Spacer()
                    Spacer()
                    
                    Text("10")
                        .font(.title2)
                    
                    Image("bomb")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height:50)
                    
                    Spacer()
                }
                
                HStack
                {
                    Spacer()
                    
                    Text("Win Reward: ")
                        .font(.title2)
                    
                    Spacer()
                    Spacer()
                    
                    Text("2")
                        .font(.title2)
                    
                    Image("coin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Spacer()
                }
                
                HStack
                {
                    Spacer()
                    
                    Text("Coin Reward: ")
                        .font(.title2)
                    
                    Spacer()
                    Spacer()
                    
                    Text("0")
                        .font(.title2)
                    
                    Image("coin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Spacer()
                }
                
                HStack
                {
                    Spacer()
                    
                    Text("Total coins: ")
                        .font(.title2)
                    
                    Spacer()
                    Spacer()
                    
                    Text(String(Int.random(in: 100...4500000)))
                        .font(.title2)
                    
                    Image("coin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Spacer()
                }
                
                
                Button(action: {
                    //winScreen show = false
                }, label: {
                    Image("check")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 50)
                        .padding()
                        .clipped()
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 3)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 3, x:2, y: 2)
                        )
                })
                .padding([.top], 30)
                
            }
            
            Spacer()
                
            
        }
        .frame(width: 375, height: 400)
        .opacity(0.8)
        .background(.lightGray)
        .cornerRadius(15)
    }
}

#Preview {
    winView()
}
