//
//  PrimeHelper.swift
//  Lab1_Najnin_Sultana
//
//  Created by Najnin on 2026-03-08.
//

import Foundation

struct PrimeHelper {
    //isPrime checks whether a number is prime.
    static func isPrime(_ number: Int) -> Bool {
        if number < 2 { return false }
        if number == 2 { return true }
        if number % 2 == 0 { return false }
        
        let limit = Int(Double(number).squareRoot())
        if limit >= 3 {
            for i in stride(from: 3, through: limit, by: 2) {
                if number % i == 0 {
                    return false
                }
            }
        }
        
        return true
    }
}
