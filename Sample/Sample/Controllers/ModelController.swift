//
//  ModelController.swift
//  Sample
//
//  Created by Vishnu on 04/12/15.
//  Copyright © 2015 Vishnu. All rights reserved.
//

import UIKit


class ModelController: NSObject, UIPageViewControllerDataSource {

    var pageCount : Int
    var pageData : Dictionary<String,String>!
    override init() {
        self.pageCount = 4
        super.init()
        self.getData()
    }
    
    func getData()->Void
    {
        let filePath = NSBundle.mainBundle().pathForResource("data",ofType:"json")
        if let data = try? NSData(contentsOfFile:filePath!, options:NSDataReadingOptions.DataReadingUncached)
        {
            pageData = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! Dictionary<String,String>
        }
    }

    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> UIViewController? {
        if (self.pageCount == 0) || (index >= self.pageCount) {
            return nil
        }
        switch index
        {
        case 0 :
            var imageVC : ImageViewController
        imageVC = storyboard.instantiateViewControllerWithIdentifier("ImageViewController") as! ImageViewController
            imageVC.imageName = pageData["image"]
            return imageVC
        case 1 :
            var webVC : WebViewController
            webVC = storyboard.instantiateViewControllerWithIdentifier("WebViewController") as! WebViewController
            webVC.viewTag = 0
            webVC.webUrl = pageData["webUrl"]
            return webVC
        case 2 :
            var webVC : WebViewController
            webVC = storyboard.instantiateViewControllerWithIdentifier("WebViewController") as! WebViewController
            webVC.viewTag = 1
            webVC.webUrl = pageData["webFile"]
            return webVC
        case 3 :
            var dataVC : DataViewController
            dataVC = storyboard.instantiateViewControllerWithIdentifier("DataViewController") as! DataViewController
            return dataVC
        default : return nil
            
            
        }
    }

    func indexOfViewController(viewController : UIViewController) -> Int {
        if viewController.isKindOfClass(ImageViewController)
        {
            return 0
        }
        else if viewController.isKindOfClass(WebViewController)
        {
            let webVC = viewController as! WebViewController
            if webVC.viewTag == 0
            {
                return 1
            }
            else
            {
                return 2
            }
        }
        return 3
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if index == NSNotFound {
            return nil
        }
        
        index++
        if index == pageCount {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}

