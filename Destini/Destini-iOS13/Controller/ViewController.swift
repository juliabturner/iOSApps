//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        var choosen = sender.currentTitle!
        
        storyBrain.nextStory(input : choosen)
        
        updateUI()
    
    }
    
    func updateUI() {
        storyLabel.text =  storyBrain.getHeadText()
        choice1Button.setTitle(storyBrain.getButton1(), for: .normal)
        choice2Button.setTitle(storyBrain.getButton2(), for: .normal)
    }
    
}

