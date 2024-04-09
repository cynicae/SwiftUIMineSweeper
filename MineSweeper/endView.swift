//
//  endView.swift
//  MineSweeper
//
//  Created by Jasper Katalevsky on 4/9/24.
//

import SwiftUI

struct endView: View {
    var body: some View {
        
        VStack
        {
            Spacer()
            VStack
            {
                HStack
                {
                    Image("bombExploded")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    Text("BOOM!")
                        .font(.title2)
                    
                    Image("bombExploded")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                
            }
            .frame(width: 350, height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x:2, y: 2)
            )
            
            
            VStack
            {
                
                
                //TODO: Place image of coins
                Spacer()
                
                HStack
                {
                    Text("25")
                        .font(.title2)
                    Image("coin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                }
                
                
                Spacer()
                
                Text("Continue?")
                    .font(.title2)
                Text("(+5 seconds)")
                    .font(.title2)
                
                Spacer()
                Spacer()
                
                Button(action: {
                    //TODO: Restart game after a video has been played
                }, label: {
                    HStack
                    {
                        Image("heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Text("Continue")
                            .font(.title2)
                            .foregroundStyle(.black)
                        Spacer()
                        Image("coin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .clipped()
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(lineWidth: 3)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x:2, y: 2)
                    )
                    
                })
                .frame(width: 300)
                .border(.black, width: 3)
                Spacer()
                Button(action: {
                    //TODO: Restart game after a video has been played
                }, label: {
                    HStack
                    {
                        Image("heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Text("Continue")
                            .font(.title2)
                            .foregroundStyle(.black)
                        Spacer()
                        Image("coin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .clipped()
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(lineWidth: 3)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x:2, y: 2)
                    )
                    
                })
                .frame(width: 300)
                
                .border(.black, width: 3)
                
                Spacer()
                
                HStack
                {
                    Spacer()
                    
                    Button(action: {
                        //TODO: Store page (prob not gunna do rn)
                    }, label: {
                        
                        Image("bag")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding()
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 3)
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 3, x:2, y: 2)
                            )
                        
                    })
                    Spacer()
                    
                    Button(action: {
                        //TODO: Play next game
                    }, label: {
                        Text("End game")
                            .foregroundStyle(Color.black)
                            .frame(width: 80, height: 40)
                            .padding()
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 3)
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 3, x:2, y: 2)
                                )
                        
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        //TODO: Store page (prob not gunna do rn)
                    }, label: {
                        
                        Image("eye")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding()
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 3)
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 3, x:2, y: 2)
                            )
                        
                    })
                    Spacer()
                    
                    
                    
                }
                
                
                Spacer()
            }
            .frame(width: 350, height: 400)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x:2, y: 2)
            )
            
            Spacer()
        }
        .frame(width: 500)
        .background(Color.lightGray)

    }
}



#Preview {
    endView()
}
