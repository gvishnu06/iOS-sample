//
//  WebViewController.swift
//  Sample
//
//  Created by Vishnu on 05/12/15.
//  Copyright © 2015 Vishnu. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    var viewTag : Int!
    var webUrl : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        //webView.scrollView.scrollEnabled = false;
        if viewTag == 0
        {
            loadUrl(webUrl)
        }
        else
        {
            loadFile(webUrl)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        webView.delegate = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        webView.stopLoading()
        hideIndicator()
        webView.delegate = nil
    }
    
    func loadUrl(url : String)
    {
        showIndicator()
        let url = NSURL (string: url);
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
    }
    
    func loadFile(fileUrl : String)
    {
        let localfilePath = NSBundle.mainBundle().URLForResource(fileUrl, withExtension: "html");
        let myRequest = NSURLRequest(URL: localfilePath!);
        webView.loadRequest(myRequest)
    }

    func webViewDidFinishLoad(webView: UIWebView)
    {
        hideIndicator()
    }
    
    func showIndicator()
    {
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideIndicator()
    {
        if activityIndicator != nil
        {
            activityIndicator.removeFromSuperview()
            activityIndicator.stopAnimating()
        }
    }

}
