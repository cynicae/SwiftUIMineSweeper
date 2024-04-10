//
//  LevelView.swift
//  MineSweeper
//
//  Created by Jasper Katalevsky on 4/9/24.
//

import SwiftUI

struct LevelView: View {
    @State private var easyImage = ""
    @State private var mediumImage = ""
    @State private var hardImage = ""
    @State private var extremeImage = ""
    var body: some View {
        // set gameOn to false (stops timer and such)
        
        VStack
        {
            HStack
            {
                Spacer()
                
                Image("happy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                
                Spacer()
                
                Text("New Game")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image("sad")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                
                Spacer()
            }
            
            .frame(width: 350, height: 50)
            .background(Color.lightGray)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x:2, y: 2)
            )
            
            Spacer()
            
            VStack
            {
                Spacer()
               VStack
                {
                    Button(action: {
                        //gridSize = 7
                        easyImage = "bomb"
                        mediumImage = ""
                        hardImage = ""
                        extremeImage = ""
                    }, label: {
                        HStack
                        {
                            Spacer()
                            
                            Image(easyImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            VStack
                            {
                                Text("Easy")
                                Text("7x7 10 mines")
                            }
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .frame(width: 315, height: 50)
                        .background(Color.lightGray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 3)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 3, x:2, y: 2)
                            )
                    })
                    
                    Button(action: {
                        //gridSize = 8
                        mediumImage = "bomb"
                        easyImage = ""
                        hardImage = ""
                        extremeImage = ""
                    }, label: {
                        HStack
                        {
                            Spacer()
                            
                            Image(mediumImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            VStack
                            {
                                Text("Medium")
                                Text("8x8 10 mines")
                            }
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .frame(width: 315, height: 50)
                        .background(Color.lightGray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 3)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 3, x:2, y: 2)
                            )
                    })
                    
                    Button(action: {
                        //gridSize = 8
                        mediumImage = ""
                        easyImage = ""
                        hardImage = "bomb"
                        extremeImage = ""
                    }, label: {
                        HStack
                        {
                            Spacer()
                            
                            Image(hardImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            VStack
                            {
                                Text("Hard")
                                Text("9x9 10 mines")
                            }
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .frame(width: 315, height: 50)
                        .background(Color.lightGray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 3)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 3, x:2, y: 2)
                            )
                    })
                    
                    Button(action: {
                        //gridSize = 8
                        mediumImage = ""
                        easyImage = ""
                        hardImage = ""
                        extremeImage = "bomb"
                    }, label: {
                        HStack
                        {
                            Spacer()
                            
                            Image(extremeImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            VStack
                            {
                                Text("Hard")
                                Text("10x10 10 mines")
                            }
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .frame(width: 315, height: 50)
                        .background(Color.lightGray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 3)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 3, x:2, y: 2)
                            )
                    })
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                HStack
                {
                    Spacer()
                    
                    Button(action: {
                        //isShowingLevel = false
                    }, label: {
                        Image("x")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 3)
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 3, x:2, y: 2)
                                )
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        //gameOn = true
                    }, label: {
                        HStack
                        {
                            Spacer()
                            
                            Text("Start")
                                .fontWeight(.bold)
                                .foregroundStyle(Color.black)
                            
                            Spacer()
                            
                            Image("check")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                        .frame(width: 120, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 3)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 3, x:2, y: 2)
                            )
                           
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        // do nothing
                    }, label: {
                        Image("calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
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
            .frame(width: 350, height: 700)
            .background(Color.lightGray)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x:2, y: 2)
                )
            
        }
        .frame(width: UIScreen.screenWidth)
        .background(Color.lightGray)
    }
}

#Preview {
    LevelView()
}
