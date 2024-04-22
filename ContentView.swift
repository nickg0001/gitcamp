//
//  ContentView.swift
//  golfapp
//
//  Created by Nick Gibson on 4/21/24.
//

import SwiftUI

@main
struct GolfScoreTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var username = ""
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            GolfScoreTrackerView()
        } else {
            VStack {
                TextField("Enter Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Login") {
                    if username == "Nickg01" {
                        isLoggedIn = true
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.title)
                .cornerRadius(10)

                Spacer()
            }
            .padding()
            .navigationTitle("Login")
        }
    }
}

struct GolfScoreTrackerView: View {
    @State private var currentHole = 1
    @State private var strokes = 0
    @State private var par = 3
    @State private var totalScore = 0
    @State private var showCelebration = false

    var body: some View {
        ZStack {
            Image("golfguy")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)  // Ensure image fills the entire background

            VStack {
                if showCelebration {
                    Text("🎆 Congratulations! 🎆")
                        .font(.largeTitle)
                        .padding()
                }
                
                Text("Hole \(currentHole)")
                    .font(.title)
                    .padding()

                HStack {
                    Button(action: { if strokes > 0 { strokes -= 1 } }) {
                        Image(systemName: "minus.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                    }

                    Text("\(strokes)")
                        .font(.title)
                        .padding()

                    Button(action: { strokes += 1 }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                        .foregroundColor(.green)
                    }
                }

                TextField("Par for hole \(currentHole)", value: $par, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()
                    .multilineTextAlignment(.center) // Centers text in the TextField

                Button("Next Hole") {
                    updateScore()
                    if currentHole == 18 {
                        showCelebrationIfNeeded()
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.title)
                .cornerRadius(10)

                Text("Total Score: \(totalScore)")
                    .font(.title)
                    .padding()

                Button("Start Another Round") {
                    resetGame()
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .font(.title)
                .cornerRadius(10)

                Spacer()
            }
        }
        .padding()
    }

    private func updateScore() {
        totalScore += (strokes - par)
        strokes = 0
        par = 3
        if currentHole < 18 {
            currentHole += 1
        }
    }

    private func showCelebrationIfNeeded() {
        if totalScore < 0 {
            withAnimation {
                showCelebration = true
            }
        }
    }

    private func resetGame() {
        currentHole = 1
        strokes = 0
        par = 3
        totalScore = 0
        showCelebration = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


