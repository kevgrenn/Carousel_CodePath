//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by kevin grennan on 2/10/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var welcomeScroll: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var parentSpinButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parentSpinButton.alpha = 0
        welcomeScroll.delegate = self
        welcomeScroll.contentSize = CGSize(width:1280, height:568)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page : Int = Int(round(welcomeScroll.contentOffset.x / 320))
        pageControl.currentPage = page
        
        if page == 3{
        pageControl.hidden = true
        UIView.animateWithDuration(0.5) { () -> Void in
            // Return the views transform properties to their default states.
            self.parentSpinButton.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.parentSpinButton.alpha = 1
            }
        }else{
            UIView.animateWithDuration(0.5) { () -> Void in
                // Return the views transform properties to their default states.
                self.parentSpinButton.transform = CGAffineTransformIdentity
                // Set the alpha properties of the views to fully opaque
                self.parentSpinButton.alpha = 0
            }        }
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
