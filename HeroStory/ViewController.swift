//
//  ViewController.swift
//  HeroStory
//
//  Created by Jonathan Jayet on 03/06/2014.
//  Copyright (c) 2014 Jonathan Jayet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label : UILabel
    @IBOutlet var button : UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animateLabel(newText : String, characterDelay : NSTimeInterval) {
        label.text = ""
        for i in newText
        {
            dispatch_async(dispatch_get_main_queue(),
                {
                    self.label.text = self.label.text + i
                })
            NSThread.sleepForTimeInterval(characterDelay)
        }
    }
    
    @IBAction func buttonTapped(AnyObject) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0),
            {
                self.animateLabel("Un jeu dont tu es le héros ?", characterDelay:0.1);
            });
    }
}

