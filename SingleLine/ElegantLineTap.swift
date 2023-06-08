//
//  ElegantLineTap.swift
//  SingleLine
//
//  Created by Kevin Buchholz on 5/1/23.
//

import SwiftUI

struct ElegantLineTap: View {
    @State var lineStart = CGPoint.zero
    @State var lineEnd = CGPoint.zero
    @State var lineCount = 0
    // have to cheat the tapCount to not get a divide by zero error
    @State var tapCount = 1
    @State var tapToSwipeRatio = 0
    @State var redValue = 0.0
    @State var greenValue = 1.0
    @State var blueValue = 0.0
    
    
    func ratioToColor() {
        if tapToSwipeRatio == 0 {
            redValue = 0
            greenValue = 1
        } else if tapToSwipeRatio == 1 {
            redValue = 0.1
            greenValue = 1
        }else if tapToSwipeRatio == 2 {
            redValue = 0.2
            greenValue = 1
        }else if tapToSwipeRatio == 3 {
            redValue = 0.3
            greenValue = 1
        }else if tapToSwipeRatio == 4 {
            redValue = 0.4
            greenValue = 1
        }else if tapToSwipeRatio == 5 {
            redValue = 0.5
            greenValue = 1
        }else if tapToSwipeRatio == 6 {
            redValue = 0.6
            greenValue = 1
        }else if tapToSwipeRatio == 7 {
            redValue = 0.7
            greenValue = 1
        }else if tapToSwipeRatio == 8 {
            redValue = 0.8
            greenValue = 1
        }else if tapToSwipeRatio == 9 {
            redValue = 0.9
            greenValue = 1
        }else if tapToSwipeRatio == 10 {
            redValue = 1
            greenValue = 1
        }else if tapToSwipeRatio == 11 {
            redValue = 1
            greenValue = 0.9
        }else if tapToSwipeRatio == 12 {
            redValue = 1
            greenValue = 0.8
        }else if tapToSwipeRatio == 13 {
            redValue = 1
            greenValue = 0.7
        }else if tapToSwipeRatio == 14 {
            redValue = 1
            greenValue = 0.6
        }else if tapToSwipeRatio == 15 {
            redValue = 1
            greenValue = 0.5
        }else if tapToSwipeRatio == 16 {
            redValue = 1
            greenValue = 0.4
        }else if tapToSwipeRatio == 17 {
            redValue = 1
            greenValue = 0.3
        }else if tapToSwipeRatio == 18 {
            redValue = 1
            greenValue = 0.2
        }else if tapToSwipeRatio == 19 {
            redValue = 1
            greenValue = 0.1
        }else if tapToSwipeRatio == 20 {
            redValue = 1
            greenValue = 0
        }
    }
    
    var tapGesture : some Gesture {
        TapGesture()
            .onEnded {
                withAnimation {
                    tapCount += 1
                    tapToSwipeRatio = lineCount / tapCount
                    ratioToColor()

                        
                        print("You tapped.")
                        print("Swipes: \(lineCount)")
                        print("Taps: \(tapCount)")
                        print("Ratio= \(tapToSwipeRatio)")
                        print("Red Value= \(redValue)")
                        print("Green Value= \(greenValue)")
                    }
                }
            }
    
    
    var lineDrawingGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                lineStart = value.startLocation
                lineEnd = value.location
            }
            .onEnded { value in
                lineEnd = value.location
                lineCount += 1
                ratioToColor()
//                if tapToSwipeRatio == 0 {
//                    redValue = 0
//                    greenValue = 1
//                }else if redValue < 1 {
//                    if redValue <= 1 {
//                        redValue += 0.1}
//                    else { redValue = 1}
//
//                }else {
//                    if greenValue >= 0 {
//                        greenValue += -0.1}
//                    else { greenValue = 0
//                    }
//                }
                
                tapToSwipeRatio = lineCount / tapCount
                print("You Swiped.")
                print("Swipes: \(lineCount)")
                print("Taps: \(tapCount)")
                print("Ratio= \(tapToSwipeRatio)")
                print("Red Value= \(redValue)")
                print("Green Value= \(greenValue)")
            }
    }
    

    var body: some View {
        NavigationStack {
            ZStack{
                Color(red: redValue, green : greenValue, blue: blueValue)
                    .ignoresSafeArea(.all)
            
                VStack{
                    Text("Swipe Count: \(lineCount)")
                    Text("Tap Count: \(tapCount)")
                    Spacer()
                  
                    Spacer()
                    Spacer()
                }
                    Path { path in
                        path.move(to: lineStart)
                        path.addLine(to: lineEnd)
                    }
                    .stroke(Color.green, lineWidth: 0.01)
                    .contentShape(Rectangle())
                    .gesture(lineDrawingGesture)
            }
            .navigationTitle("Le Elegance")
            .padding()
            .toolbar {
                Button("Reset") {
                    lineStart = .zero
                    lineEnd = .zero
                    lineCount = 0
                    tapCount = 1
                    redValue = 0.0
                    greenValue = 1.0
                    blueValue = 0.0
                }
            }
        }
        .gesture(tapGesture)
    }
}

struct ElegantLineTap_Previews: PreviewProvider {
    static var previews: some View {
        ElegantLineTap()
    }
}
