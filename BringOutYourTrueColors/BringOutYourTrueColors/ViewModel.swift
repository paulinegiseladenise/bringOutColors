//
//  ViewModel.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-02-20.
//

import Foundation
import SwiftUI

struct ViewModel {
    
    var options = [
        ["Gröna, bruna", "Blåa, gråa", "Blandad"],
        ["Gröna, bruna", "Blåa, gråa", "Blandad"],
        ["Guld", "Silver", "Båda"]
    ]
    
    var selections = [0, 0, 0]
    
    var results = ["You have warm colors",
                   "You have cool colors",
                   "You have both warm and cool colors"]
    
    var allSelectionsMade: Bool {
        return !selections.contains(0)
    }
    
    mutating func selectOption(at Index: Int, optionIndex: Int) {
        selections[Index] = optionIndex
    }
    
    mutating func calculateResult() -> String {
        let counts =
        selections.reduce(into: [0, 0, 0]) { counts, selection in
            counts[selection] += 1
        }
        //        Note to self... behöver fixa nedanstående kod så att det står make your result is från början och inte you have warm colors....... det är i ifsatsen det blir fel...
        let maxCount = counts.max()!
        let resultIndex = counts.firstIndex(of: maxCount)!
        if resultIndex == 0 {
            return "Warm... I need to change this code..."
        } else {
            return results[resultIndex]
        }
        
        func resetTest() {
            self.selections = [0, 0, 0]
        }
    }
}

