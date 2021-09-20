//
//  ModelCard.swift
//  MatchApp
//
//  Created by Mehar on 22/08/2021.
//

import Foundation


class CardModel{
    
    func getCard() -> [Card]{
        
        var generatedNumbersArray = [Int]()
        
        //declare an empty array
        var generateCards = [Card]()
        
        //randomly generate 8 pairs of cards
        while generatedNumbersArray.count < 8 {
            
            //generate random number
            let randomNumber = Int.random(in:1...13)
           
            //ensure that the random number isnt one we already have
            
            if generatedNumbersArray.contains(randomNumber) == false{
                //store the number in the array
                generatedNumbersArray.append(Int(randomNumber))
                
                //create two new card objects
                let cardOne = Card()
                let cardTwo = Card()
                
                //Set their image names
                cardOne.imageName = "card\(randomNumber)"
                cardTwo.imageName = "card\(randomNumber)"
                
                //add them to the array
                generateCards += [cardOne,cardTwo]
            }
            
        }
        
        //randomize the cards within the array
        generateCards.shuffle()
        return generateCards
    }
}
