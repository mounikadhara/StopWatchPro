//
//  StopWatchButtons.swift
//  StopWatchApp
//
//  Created by Mounika Dara on 08/12/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var stopWatchObject = StopWatch()
    @AppStorage(StorageKeys.buttonTitle.rawValue) var buttonTitle = "Start"
    @AppStorage(StorageKeys.lapTime.rawValue) var lapTime = [LapsModel]()
    @AppStorage("buttonStyle") var buttonStyle:StopWatchButtonShapes = .roundedBorderButton
    var body: some View {
        VStack {
            
                Spacer().frame(height: UIScreen.main.bounds.height/11.2)
                HStack{
                    Spacer()
                    Menu {
                        Section("Select Buttons Style") {
                            Button {
                                buttonStyle = .squareBorderButton
                            } label: {
                                Text(StopWatchButtonShapes.squareBorderButton.rawValue.capitalizedFirstLetter)
                            }
                            Button {
                                buttonStyle = .roundedBorderButton
                            } label: {
                                Text(StopWatchButtonShapes.roundedBorderButton.rawValue.capitalizedFirstLetter)
                            }
                            Button {
                                buttonStyle = .circle
                            } label: {
                                Text(StopWatchButtonShapes.circle.rawValue.capitalizedFirstLetter)
                            }
                            Button {
                                buttonStyle = .SquareFilledButton
                            } label: {
                                Text(StopWatchButtonShapes.SquareFilledButton.rawValue.capitalizedFirstLetter)
                            }
                            Button {
                                buttonStyle = .roundedSquareFilledButton
                            } label: {
                                Text(StopWatchButtonShapes.roundedSquareFilledButton.rawValue.capitalizedFirstLetter)
                            }
                            Button {
                                buttonStyle = .capsule
                            } label: {
                                Text(StopWatchButtonShapes.capsule.rawValue.capitalizedFirstLetter)
                            }
                        }
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: UIScreen.main.bounds.width/13.8, height: UIScreen.main.bounds.width/13.8)
                    }
                }
            
           
                Text(stopWatchObject.timeElapsedFormatted)
                    .bold()
                    .fontWeight(.heavy)
                    .font(.system(size: UIScreen.main.bounds.height/17.92, weight: .regular, design: .default))
                    .foregroundColor(Color.white)
             
            
            HStack{
                Spacer()
                Button {
                    if stopWatchObject.timeElapsedFormatted != "00:00.00"{
                        let newLap = LapsModel(stopWatchObject.timeElapsedFormatted)
                        lapTime.append(newLap)
                    }
                } label: {
                    StopWatchButtonsView(buttonTitle: "Lap", foregroundColor: .white,  backgroundColor: .gray, cornerRadius: UIScreen.main.bounds.height/17.92, stopWatchButtonShape: $buttonStyle)
                }
                Spacer()
                Button {
                    stopWatchObject.stop()
                    buttonTitle = "Start"
                    lapTime.removeAll()
                } label: {
                    StopWatchButtonsView(buttonTitle: "Reset", foregroundColor: .white,  backgroundColor: .red, cornerRadius: UIScreen.main.bounds.height/17.92, stopWatchButtonShape: $buttonStyle)
                }
                
                Spacer()
                Button {
                    if buttonTitle == "Start"{
                        buttonTitle = "Pause"
                        stopWatchObject.start()
                    }else {
                        buttonTitle = "Start"
                        stopWatchObject.pause()
                    }
                } label: {
                    StopWatchButtonsView(buttonTitle: buttonTitle, foregroundColor: .white, backgroundColor: lightGreenColor, cornerRadius: UIScreen.main.bounds.height/17.92, stopWatchButtonShape: $buttonStyle)
                }
                Spacer()
            }
            VStack{
                Spacer().frame(height: UIScreen.main.bounds.height/29.86666)
                ScrollView{
                    ForEach(0..<lapTime.count, id: \.self) { index in
                        HStack{
                            Spacer().frame(width: UIScreen.main.bounds.width/41.4)
                            Text("Lap \(index + 1)")
                            Spacer()
                            Text(String(lapTime[index].lap))
                                .foregroundColor(Color.green)
                            Spacer().frame(width: UIScreen.main.bounds.width/41.4)
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/17.92, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                }
            }.padding(.bottom, UIScreen.main.bounds.height/17.92)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



