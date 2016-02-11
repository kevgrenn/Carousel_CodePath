//
//  TermsViewController.swift
//  Carousel
//
//  Created by kevin grennan on 2/11/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    let url = "https://www.dropbox.com/terms?mobile=1"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Convert the url String to a NSURL object.
        let requestURL = NSURL(string:url)
        // Place the URL in a URL Request.
        let request = NSURLRequest(URL: requestURL!)
        // Load Request into WebView.
        webView.loadRequest(request)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
