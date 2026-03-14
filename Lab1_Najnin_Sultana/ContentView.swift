//
//  ContentView.swift
//  Lab1_Najnin_Sultana
//
//  Created by Najnin on 2026-03-08.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = PrimeGameViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.white, Color.cyan.opacity(0.08)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 28) {
                
                Spacer()
                
                Text("\(viewModel.currentNumber)")
                    .font(.system(size: 60, weight: .light, design: .rounded))
                    .foregroundColor(.teal)
                
                VStack(spacing: 18) {
                    Button(action: {
                        viewModel.choosePrime()
                    }) {
                        Text("Prime")
                            .font(.title2)
                            .italic()
                            .foregroundColor(.teal)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(14)
                            .shadow(radius: 3)
                    }
                    .disabled(viewModel.hasAnsweredCurrentQuestion)
                    
                    Button(action: {
                        viewModel.chooseNotPrime()
                    }) {
                        Text("Not Prime")
                            .font(.title2)
                            .italic()
                            .foregroundColor(.teal)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(14)
                            .shadow(radius: 3)
                    }
                    .disabled(viewModel.hasAnsweredCurrentQuestion)
                }
                .padding(.horizontal, 30)
                
                Group {
                    if viewModel.showCorrectIcon {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                            .foregroundColor(.green)
                    } else if viewModel.showWrongIcon {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                            .foregroundColor(.red)
                    } else {
                        Color.clear
                            .frame(width: 90, height: 90)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text("Correct: \(viewModel.correctCount)")
                    Text("Wrong: \(viewModel.wrongCount)")
                    Text("Attempts: \(viewModel.attemptCount)")
                }
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            }
            .padding()
        }
        .alert("10 Attempts Summary", isPresented: $viewModel.showSummaryDialog) {
            Button("OK") {
                viewModel.resetAfterDialog()
            }
        } message: {
            Text(viewModel.summaryMessage)
        }
    }
}

#Preview {
    ContentView()
}
