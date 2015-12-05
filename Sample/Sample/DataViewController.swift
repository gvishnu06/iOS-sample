//
//  DataViewController.swift
//  Sample
//
//  Created by Vishnu on 04/12/15.
//  Copyright © 2015 Vishnu. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var dataLabel: UILabel!
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataLabel.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func clickAction(sender: AnyObject) {
        self.dataLabel.hidden = false
        self.dataLabel.text = String("Clicked \(++counter) times")
    }

}

