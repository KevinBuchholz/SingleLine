//
//  SingleLineAndTap.swift
//  SingleLine
//
//  Created by Kevin Buchholz on 5/1/23.
//

//
//  SingleLine.swift
//  SingleLine
//
//  Created by Kevin Buchholz on 5/1/23.
//

import SwiftUI



struct SingleLineAndTap: View {
    @State var lineStart = CGPoint.zero
    @State var lineEnd = CGPoint.zero
    @State var lineCount = 0
    // have to cheat the tapCount to not get a divide by zero error
    @State var tapCount = 1
    @State var tapToSwipeRatio = 0
    @State private var color : Color = Color.primary
    
    var tapGesture : some Gesture {
        TapGesture()
            .onEnded {
                withAnimation {
                    color = Color.blue
                    tapCount += 1
                    tapToSwipeRatio = lineCount / tapCount
                    print("You tapped.")
                    print("Swipes: \(lineCount)")
                    print("Taps: \(tapCount)")
                    print("Ratio= \(tapToSwipeRatio)")
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
                tapToSwipeRatio = lineCount / tapCount
                print("You Swiped.")
                print("Swipes: \(lineCount)")
                print("Taps: \(tapCount)")
                print("Ratio= \(tapToSwipeRatio)")
            }
    }
    

    var body: some View {
        NavigationStack {
            Text("Touch and drag to make a line.")
            Text("Swipe Count: \(lineCount)")
            Text("Tap Count: \(tapCount)")
            Spacer()
            Text("Tap on the rectangle to change its color.")
            Rectangle()
                .foregroundColor(color)
                .frame(width: 250, height: 250)
                .gesture(tapGesture)
            Spacer()
            Spacer()
            NavigationLink("Make it ELEGANT", destination: ElegantLineTap())
            if tapToSwipeRatio <= 5 {
            Path { path in
                path.move(to: lineStart)
                path.addLine(to: lineEnd)
            }
                .stroke(Color.green, lineWidth: 8.0)
                .contentShape(Rectangle())
                .gesture(lineDrawingGesture)
            }else if tapToSwipeRatio <= 15 {
                Path { path in
                    path.move(to: lineStart)
                    path.addLine(to: lineEnd)
                }
                    .stroke(Color.yellow, lineWidth: 8.0)
                    .contentShape(Rectangle())
                    .gesture(lineDrawingGesture)
                }else {
                Path { path in
                    path.move(to: lineStart)
                    path.addLine(to: lineEnd)
                }
                    .stroke(Color.red, lineWidth: 8.0)
                    .contentShape(Rectangle())
                    .gesture(lineDrawingGesture)
                }
            
            
        }
        .navigationTitle("Line Drawing (now with Tapping!)")
        .padding()
        .toolbar {
            Button("Reset") {
                lineStart = .zero
                lineEnd = .zero
                lineCount = 0
                tapCount = 1
            }
        }
    }
}

struct SingleLineAndTap_Previews: PreviewProvider {
    static var previews: some View {
        SingleLineAndTap()
    }
}

