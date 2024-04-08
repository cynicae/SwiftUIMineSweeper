//
//  ContentView.swift
//  MineSweeper
//
//  Created by Jasper Katalevsky on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numRows = 5
    @State private var numCols = 5
    @State private var numMines = 24
    @State private var gameOn = false
    @State private var hiddenButtons: Set<Int> = []
    var body: some View {
        VStack {
            
            HStack
            {
                Button(action: {
                    //TODO: Switch to flag mode
                }, label: {
                    Image("flag")
                        .resizable()
                        .scaledToFit()
                })
                .buttonStyle(MineSweeperButtonStyle())
                Button(action: {
                    //TODO: Hint button, probably won't implement this
                }, label: {
                    Image("lightbulb")
                        .resizable()
                        .scaledToFit()
                })
                .buttonStyle(MineSweeperButtonStyle())
                
                mineCount(count: numMines)
                
                Button(action: {
                    
                }, label: {
                    Image("smiley")
                        .resizable()
                        .scaledToFit()
                })
                .buttonStyle(MineSweeperButtonStyle())
                
                mineClock(gameRunning: gameOn)
                // TODO: Conditional around when the game is running
                
                Button(action: {
                    
                }, label: {
                    Image("gear")
                        .resizable()
                        .scaledToFit()
                })
                .buttonStyle(MineSweeperButtonStyle())
                Button(action: {
                    
                }, label: {
                    Image("fullscreen")
                        .resizable()
                        .scaledToFit()
                })
                .buttonStyle(MineSweeperButtonStyle())
                
                
            }
            .frame(width: 350, height: 50)
            .border(Color(.blue))
            Spacer()
            
            VStack(spacing: 1)
            {
                ForEach(0..<numRows, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(0..<numCols, id: \.self) { column in
                            let index = row * self.numCols + column
                            
                            Button(action: {
                                hiddenButtons.insert(index)
                            }, label: {
                                Text("h")
                            })
                            .buttonStyle(MineSweeperButtonStyle())
                            .opacity(self.hiddenButtons.contains(index) ? 0 : 1)
                        }
                        
                    }
                    .padding()
                }
            }
            Spacer()
        }
    }
    func setMines(rows: Int, column: Int)
    {
        var mines = Array(repeating: Array(repeating: 0, count: rows), count: column)
        
    }
}




struct MineSweeperButtonStyle : ButtonStyle
{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .frame(width: 30, height: 30)
            .background(Color.gray)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.black, lineWidth: 1)
            )
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct mineCount : View
{
    let count: Int
    
    var body: some View
    {
        Text("\(count)")
            .padding(5)
            .frame(width: 75, height: 29)
            .background(Color.gray)
            .cornerRadius(5)
            .foregroundColor(.red)
            .font(.system(size: 20, weight: .bold, design: .monospaced))
            .multilineTextAlignment(.center)
            .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color.black))
    }
}

struct mineClock : View
{
    let gameRunning: Bool
    @State private var currentTime: Int = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //got some of this logic from chatgpt
    
    var body : some View
    {
        VStack
        {
            
            Text("\(formattedTime(currentTime))")
                .padding(5)
                .frame(width: 75, height: 29)
                .background(Color.gray)
                .cornerRadius(5)
                .foregroundColor(.red)
                .font(.system(size: 20, weight: .bold, design: .monospaced))
                .multilineTextAlignment(.center)
                .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color.black))
            
            
        }
        .onReceive(timer) { _ in
            if self.gameRunning {
                self.currentTime += 1
            } else
            {
                self.currentTime = 0
            }
        }
    }
    func formattedTime(_ time: Int) -> String
    {
        let seconds = time % 60
        return String(seconds)
    }
    
    func getTime() -> Int
    {
        return self.currentTime
    }
    
}



#Preview {
    ContentView()
}
