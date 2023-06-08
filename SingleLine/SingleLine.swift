//
//  SingleLine.swift
//  SingleLine
//
//  Created by Kevin Buchholz on 5/1/23.
//

import SwiftUI

struct SingleLine: View {
    @State var lineStart = CGPoint.zero
    @State var lineEnd = CGPoint.zero
    @State var lineCount = 0
    
    var lineDrawingGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                lineStart = value.startLocation
                lineEnd = value.location
            }
            .onEnded { value in
                lineEnd = value.location
                lineCount += 1
                print("\(lineCount)")
               
            }
    }
    
    var body: some View {
        NavigationStack {
            Text("Touch and drag to make a line.")
            Text("Count: \(lineCount)")
            Spacer()
            NavigationLink("Let's get more complicated!", destination: SingleLineAndTap())
            if lineCount <= 10 {
            Path { path in
                path.move(to: lineStart)
                path.addLine(to: lineEnd)
            }
                .stroke(Color.green, lineWidth: 8.0)
                .contentShape(Rectangle())
                .gesture(lineDrawingGesture)
            }else if lineCount <= 20 {
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
        .navigationTitle("Line Drawing and Tapping")
        .padding()
        .toolbar {
            Button("Reset") {
                lineStart = .zero
                lineEnd = .zero
                lineCount = 0
            }
        }
    }
}

struct SingleLine_Previews: PreviewProvider {
    static var previews: some View {
        SingleLine()
    }
}
