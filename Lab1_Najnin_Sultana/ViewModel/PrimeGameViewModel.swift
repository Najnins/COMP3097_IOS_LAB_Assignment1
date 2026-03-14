//
//  PrimeGameViewModel.swift
//  Lab1_Najnin_Sultana
//
//  Created by Najnin on 2026-03-08.
//

import Foundation
import SwiftUI
import Combine

final class PrimeGameViewModel: ObservableObject {
    
    @Published var currentNumber: Int = Int.random(in: 1...100)
    @Published var correctCount: Int = 0
    @Published var wrongCount: Int = 0
    @Published var attemptCount: Int = 0
    
    @Published var showCorrectIcon: Bool = false
    @Published var showWrongIcon: Bool = false
    @Published var hasAnsweredCurrentQuestion: Bool = false
    
    @Published var showSummaryDialog: Bool = false
    @Published var summaryMessage: String = ""
    
    private var timer: Timer?
    
    init() {
        startTimer()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func startTimer() {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            self?.handleTimerTick()
        }
    }
    
    func handleTimerTick() {
        if !hasAnsweredCurrentQuestion {
            wrongCount += 1
            attemptCount += 1
            showFeedback(isCorrect: false)
            checkForSummary()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
            self?.goToNextNumber()
        }
    }
    
    func choosePrime() {
        submitAnswer(userSaysPrime: true)
    }
    
    func chooseNotPrime() {
        submitAnswer(userSaysPrime: false)
    }
    
    private func submitAnswer(userSaysPrime: Bool) {
        guard !hasAnsweredCurrentQuestion else { return }
        
        hasAnsweredCurrentQuestion = true
        
        let actualIsPrime = PrimeHelper.isPrime(currentNumber)
        let isCorrect = (userSaysPrime == actualIsPrime)
        
        if isCorrect {
            correctCount += 1
        } else {
            wrongCount += 1
        }
        
        attemptCount += 1
        showFeedback(isCorrect: isCorrect)
        checkForSummary()
    }
    
    private func showFeedback(isCorrect: Bool) {
        showCorrectIcon = isCorrect
        showWrongIcon = !isCorrect
    }
    
    private func checkForSummary() {
        if attemptCount % 10 == 0 {
            summaryMessage = """
            Attempts: \(attemptCount)
            Correct: \(correctCount)
            Wrong: \(wrongCount)
            """
            showSummaryDialog = true
        }
    }
    
    func goToNextNumber() {
        currentNumber = Int.random(in: 1...100)
        showCorrectIcon = false
        showWrongIcon = false
        hasAnsweredCurrentQuestion = false
    }
    
    func resetAfterDialog() {
        goToNextNumber()
    }
}
