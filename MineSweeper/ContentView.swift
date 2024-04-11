//
//  ContentView.swift
//  MineSweeper
//
//  Created by Jasper Katalevsky on 4/1/24.
//

import SwiftUI
import Combine
import AVFAudio

struct ContentView: View {
    @State private var numRows = 5
    @State private var numCols = 5
    @State private var numMines = 10
    @State private var gameOn = true
    @State private var hiddenButtons: Set<Int> = []
    @State private var gridSize = 7
    @State private var minesweeperBoard: MinesweeperBoard?
    @State private var showEndScreen = false
    @State private var isShowingLevelPicker = false
    @State private var easyImage = ""
    @State private var mediumImage = ""
    @State private var hardImage = ""
    @State private var extremeImage = ""
    @State private var gameWon = false
    @State private var showWinScreen = false

    
    

    var body: some View {
        ZStack {
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
                        self.isShowingLevelPicker.toggle()
                    }) {
                        Image("smiley")
                            .resizable()
                            .scaledToFit()
                    }
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
                        .onReceive(minesweeperBoard.$gameWon) { gameWon in
                           if gameWon {
                                showEndScreen = false
                                gameOn = false
                                showWinScreen = true
                                       
                            }
                        }
                        .frame(width: UIScreen.screenWidth, height: 600)
                }
            }
            
            Spacer()
        }
          if isShowingLevelPicker
            {
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
                              gridSize = 7
                              numMines = 10
                              easyImage = "bomb"
                              mediumImage = ""
                              hardImage = ""
                              extremeImage = ""
                              gameOn = false
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
                              gridSize = 8
                              numMines = 10
                              mediumImage = "bomb"
                              easyImage = ""
                              hardImage = ""
                              extremeImage = ""
                              gameOn = false
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
                              gridSize = 9
                              numMines = 10
                              mediumImage = ""
                              easyImage = ""
                              hardImage = "bomb"
                              extremeImage = ""
                              gameOn = false
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
                              gridSize = 10
                              numMines = 10
                              mediumImage = ""
                              easyImage = ""
                              hardImage = ""
                              extremeImage = "bomb"
                              gameOn = false
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
                              isShowingLevelPicker = false
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
                              gameOn = true
                              isShowingLevelPicker = false
                              showEndScreen = false
                              startGame(gridSize: gridSize)
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
                  .frame(width: 350, height: 500)
                  .background(Color.lightGray)
                  .overlay(
                      RoundedRectangle(cornerRadius: 0)
                          .stroke(lineWidth: 3)
                          .foregroundColor(.white)
                          .shadow(color: .black, radius: 3, x:2, y: 2)
                      )
                  
              }
              .frame(width: 400, height: 400)
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
                                  showEndScreen = false
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
            
          if showWinScreen
            {
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
                          showWinScreen = false
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
    @Published var gameWon: Bool = false
    
    var gameOverHandler: (() -> Void)?
    var gameWonHandler: (() -> Void)? // Add gameWonHandler
    
    func getGameOverCondition() {
        if gameIsOver {
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
    
    private func revealAllMines() {
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
        
        checkGameWon()
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
    
    private func checkGameWon() {
        var remainingCellsCount = 0
        
        for row in 0..<gridSize {
            for col in 0..<gridSize {
                if !cells[row][col].isMine && !cells[row][col].isRevealed {
                    remainingCellsCount += 1
                }
            }
        }
        
        if remainingCellsCount == 0 {
            gameWon = true
            gameWonHandler?() // Notify the game won
        }
    }
    
    
}



struct MinesweeperGridView: View {
    @ObservedObject var minesweeperBoard: MinesweeperBoard
    
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(0..<minesweeperBoard.gridSize, id: \.self) { row in
                HStack(spacing: 5) {
                    ForEach(0..<minesweeperBoard.gridSize, id: \.self) { column in
                        let index = row * minesweeperBoard.gridSize + column
                        let cell = minesweeperBoard.cells[row][column]
                        
                        
                        
                        Button(action: {
                            self.minesweeperBoard.revealCell(at: index)
                            self.buttonTapped(index: index)
                        }) {
                            if cell.isRevealed {
                                if cell.isMine {
                                    Image("bombExploded")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                } else {
                                    Text("\(cell.adjacentMines)")
                                        .foregroundColor(self.textColor(for: cell.adjacentMines))
                            
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
    
    func buttonTapped(index: Int) {
            minesweeperBoard.revealCell(at: index)
            let cell = minesweeperBoard.cells[index / minesweeperBoard.gridSize][index % minesweeperBoard.gridSize]
            if cell.isRevealed && cell.isMine {
                playSound(soundName: "bombSound")
            } else {
                playSound(soundName: "clickSound")
            }
        }
    
    func playSound(soundName: String)
    {
        guard let soundFile = NSDataAsset(name: soundName) else
        {
            print("😡 Could not read file: \(soundName)")
            return
        }
        do
        {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer?.play()
        } catch
        {
            print("Error: \(error.localizedDescription) creating audioPlayer.")
        }
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



#Preview {
    ContentView()
}
