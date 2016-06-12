//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Yuri Kasperovich on 6/11/16.
//  Copyright © 2016 Yuri Kasperovich. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // MARK: Properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    
    let spacing = 5
    let starCount = 5
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        createButtons()
    }
    
    override func intrinsicContentSize() -> CGSize {
        return summarizeButtonSizes()
    }

    override func layoutSubviews() {
        layoutButtons()
        updateButtonSelectionStates()
    }
    
    // MARK: Actions
    
    func ratingButtonTapped(button: UIButton) {
        assignRating(button)
        updateButtonSelectionStates()
    }
    
    private
    
    func createButtons() {
        for _ in 0..<starCount {
            createButton()
        }
    }
    
    func createButton() {
        let button = UIButton()
        
        let emptyStarImage  = UIImage(named: "emptyStar")!
        let filledStarImage = UIImage(named: "filledStar")!

        button.setImage(emptyStarImage, forState: .Normal)
        button.setImage(filledStarImage, forState: .Selected)
        button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
        
        button.adjustsImageWhenHighlighted = false
        
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
        
        ratingButtons += [button]
        
        addSubview(button)
    }
    
    func summarizeButtonSizes() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
    }
    
    func layoutButtons() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
    }
    
    func assignRating(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            button.selected = index < rating
        }
    }
}
