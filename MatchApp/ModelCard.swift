//
//  ModelCard.swift
//  MatchApp
//
//  Created by Mehar on 22/08/2021.
//

import Foundation


class CardModel{
    
    func getCard() -> [Card]{
        
        //declare an empty array
        var generateCards = [Card]()
        
        //randomly generate 8 pairs of cards
        for _ in 1...8{
            
            //generate random number
            let randomNumber = Int.random(in:1...13)
            
            //create two new card objects
            let cardOne = Card()
            let cardTwo = Card()
            
            //Set their image names
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
            
            //add them to the array
            generateCards += [cardOne,cardTwo]
        }
        
        //randomize the cards within the array
        generateCards.shuffle()
        return generateCards
    }
}
