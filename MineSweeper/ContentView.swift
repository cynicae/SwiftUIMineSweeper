//
//  ContentView.swift
//  MineSweeper
//
//  Created by Jasper Katalevsky on 4/1/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var numRows = 5
    @State private var numCols = 5
    @State private var numMines = 24
    @State private var gameOn = true
    @State private var hiddenButtons: Set<Int> = []
    @State private var gridSize = 9
    @State private var minesweeperBoard: MinesweeperBoard?
    @State private var showEndScreen = false
    

    var body: some View {
        ZStack {
           VStack {
               header(numMines: numMines, gameOn: gameOn)
               Spacer()
               
               VStack
               {
                   if let minesweeperBoard = minesweeperBoard {
                       MinesweeperGridView(minesweeperBoard: minesweeperBoard)
                           .onReceive(minesweeperBoard.$gameOver) { gameOver in
                               if gameOver {
                                   showEndScreen = true
                                   gameOn = false
                                   // Set showEndScreen to true when gameOver is received
                               }
                           }
                           .frame(width: UIScreen.screenWidth, height: 600)
                   }
               }
               .border(Color(.blue))
               Spacer()
          }
           
          
          if showEndScreen {
              VStack
              {
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
                                  showEndScreen = false
                                  startGame(gridSize: gridSize)
                                  gameOn = true
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
                  .frame(width: 375)
                  .background(Color.lightGray)
              }
                  .frame(width: 45, height: 50)
                  .onDisappear {
                      showEndScreen = false // Reset showEndScreen when the end screen disappears
              }
          }
      }
      .onAppear {
          startGame(gridSize: gridSize)
          gameOn = true
      }
   }
    func startGame(gridSize: Int)
    {
        minesweeperBoard = MinesweeperBoard(gridSize: gridSize)
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct header : View
{
    let numMines: Int
    let gameOn: Bool
    
    var body : some View
    {
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
    }
}

struct Cell {
    var isMine: Bool
    var isRevealed: Bool
    var adjacentMines: Int
}

struct MinesweeperGridViewWrapper: View {
    @Binding var minesweeperBoard: MinesweeperBoard?

    var body: some View {
        MinesweeperGridView(minesweeperBoard: minesweeperBoard!)
    }
}

class MinesweeperBoard: ObservableObject {
    
    @Published var gameOver: Bool = false

    var gameOverHandler: (() -> Void)?
    
    func getGameOverCondition()
    {
        if gameIsOver
        {
            gameOverHandler?()
        }
    }
    
    let gridSize: Int
    @Published var cells: [[Cell]]
    var hiddenButtons: Set<Int> = []
    var gameIsOver: Bool

    init(gridSize: Int) {
        self.gridSize = gridSize
        self.cells = Array(repeating: Array(repeating: Cell(isMine: false, isRevealed: false, adjacentMines: 0), count: gridSize), count: gridSize)
        self.gameIsOver = false
        generateMinefield()
        calculateAdjacentMines()
    }

    private func generateMinefield() {
        var minesPlaced = 0
        while minesPlaced < gridSize {
            let row = Int.random(in: 0..<gridSize)
            let col = Int.random(in: 0..<gridSize)

            if !cells[row][col].isMine {
                cells[row][col].isMine = true
                minesPlaced += 1
            }
        }
    }

    private func calculateAdjacentMines() {
        for row in 0..<gridSize {
            for col in 0..<gridSize {
                if !cells[row][col].isMine {
                    var adjacentMines = 0
                    for i in -1...1 {
                        for j in -1...1 {
                            let newRow = row + i
                            let newCol = col + j
                            if newRow >= 0 && newRow < gridSize && newCol >= 0 && newCol < gridSize && cells[newRow][newCol].isMine {
                                adjacentMines += 1
                            }
                        }
                    }
                    cells[row][col].adjacentMines = adjacentMines
                }
            }
        }
    }
    
    private func revealAllMines()
    {
        for row in 0..<gridSize {
            for col in 0..<gridSize {
                if cells[row][col].isMine {
                    cells[row][col].isRevealed = true
                }
            }
        }
    }

    func revealCell(at index: Int) {
        let row = index / gridSize
        let col = index % gridSize

        if cells[row][col].isMine {
            cells[row][col].isRevealed = true
            gameIsOver = true
            self.gameOver = true
            revealAllMines()
            
            
        } else {
            cells[row][col].isRevealed = true
            if cells[row][col].adjacentMines == 0 {
                revealAdjacentCells(row: row, col: col)
            }
        }
    }

    private func revealAdjacentCells(row: Int, col: Int) {
        for i in -1...1 {
            for j in -1...1 {
                let newRow = row + i
                let newCol = col + j
                if newRow >= 0 && newRow < gridSize && newCol >= 0 && newCol < gridSize && !cells[newRow][newCol].isMine && !cells[newRow][newCol].isRevealed {
                    cells[newRow][newCol].isRevealed = true
                    if cells[newRow][newCol].adjacentMines == 0 {
                        revealAdjacentCells(row: newRow, col: newCol)
                    }
                }
            }
        }
    }
}

struct MinesweeperGridView: View {
    @ObservedObject var minesweeperBoard: MinesweeperBoard
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(0..<minesweeperBoard.gridSize, id: \.self) { row in
                HStack(spacing: 5) {
                    ForEach(0..<minesweeperBoard.gridSize, id: \.self) { column in
                        let index = row * minesweeperBoard.gridSize + column
                        let cell = minesweeperBoard.cells[row][column]
                        
                        
                        
                        Button(action: {
                            self.minesweeperBoard.revealCell(at: index)
                        }) {
                            if cell.isRevealed {
                                if cell.isMine {
                                    Image("bombExploded")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                    //TODO: Bomb sound
                                } else {
                                    Text("\(cell.adjacentMines)")
                                        .foregroundColor(self.textColor(for: cell.adjacentMines))
                                    //TODO: Click sound
                                }
                            } else {
                                Text(" ")
                            }
                        }
                        .buttonStyle(CellButtonStyle(cell: cell))
                        //.opacity(cell.isRevealed ? 1 : 0) // Apply opacity based on cell reveal status
                    }
                }
                
            }
        }
        .frame(width: UIScreen.screenWidth)
    }
    
    func textColor(for number: Int) -> Color {
        switch number {
        case 1:
            return .blue
        case 2:
            return .green
        case 3:
            return .red
        case 4:
            return .purple
        default:
            return .black
        }
    }
}


struct CellButtonStyle: ButtonStyle {
    let cell: Cell
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .frame(width: 30, height: 30)
            .background(cell.isRevealed ? Color.white : Color.gray)
            .cornerRadius(5)
            .overlay(!cell.isRevealed ?
                RoundedRectangle(cornerRadius: 2)
                .stroke(Color.black, lineWidth: 1) : nil
            )
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

struct settingsView : View
{
    var body : some View
    {
        VStack
        {
            
        }
    }
}

struct levelPicker : View
{
    var updateGrid: (Int) -> Void
    
    var body : some View
    {
        Button(action: {
            updateGrid(10)
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
    }
}




#Preview {
    ContentView()
}
