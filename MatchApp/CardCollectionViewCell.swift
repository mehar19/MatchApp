//
//  CardCollectionViewCell.swift
//  MatchApp
//
//  Created by Mehar on 22/08/2021.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var frontCardView: UIImageView!
    
    
    @IBOutlet weak var backCardView: UIImageView!
    
    var card:Card?
    
    func configureCell(card: Card){
        
        self.card = card
        frontCardView.image = UIImage(named: card.imageName)
        
        if card.isMatched == true{
            backCardView.alpha = 0
            frontCardView.alpha = 0
        }else{
            backCardView.alpha = 1
            frontCardView.alpha = 1
        }
        
        
        if self.card?.isFlipped == true{
            flipUp(speed:0)
        }
        else{
            flipDown(speed:0)
        }
        
    }
    
    func flipUp(speed: TimeInterval = 0.3, delay: TimeInterval = 0.5){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay){
            UIView.transition(from: self.backCardView, to: self.frontCardView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        }
        card?.isFlipped = true
   
    }
    
    func flipDown(speed: TimeInterval = 0.3, delay: TimeInterval = 0.5){
        
      
        
        card?.isFlipped = false
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay){
            UIView.transition(from: self.frontCardView, to: self.backCardView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        }
    }
    
    func remove(){
        
        backCardView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontCardView.alpha = 0
        }, completion: nil)

    }
}
