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
        ["Rött, blont, brunt", "Grått, askblont, svart", "Skiftande"],
        ["Guld", "Silver", "Båda"]
    ]
    
    var selections: [Int?] = [nil, nil, nil]
    var selectionsMade = 0
    
    var results = ["You have warm colors",
                   "You have cool colors",
                   "You have both warm and cool colors"]
    
    var allSelectionsMade: Bool {
        return selectionsMade == 3
    }
    
    func selectOption(at Index: Int, optionIndex: Int) -> ViewModel {
        var newSelections = self.selections
        newSelections[Index] = optionIndex
        var newViewModel = ViewModel(selections: newSelections)
        newViewModel.selectionsMade = selectionsMade + 1
        return newViewModel
    }
    
    func optionSelected(optionIndex: Int, at index: Int) -> Bool {
        return selections[index] == optionIndex
    }
    
    func calculateResult() -> String? {
        guard allSelectionsMade else {
            return nil
        }
        let counts =
        selections.reduce(into: [0, 0, 0]) { counts, selection in
            if let selection = selection {
                counts[selection] += 1
            }
        }
        let maxCount = counts.max()!
        let resultIndex = counts.firstIndex(of: maxCount)!
        return results[resultIndex]
    }
    
    func resetTest() -> ViewModel {
        return ViewModel()
    }
}


