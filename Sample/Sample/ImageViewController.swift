//
//  ImageViewController.swift
//  Sample
//
//  Created by Vishnu on 05/12/15.
//  Copyright © 2015 Vishnu. All rights reserved.
//

import UIKit

public class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName : String!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
