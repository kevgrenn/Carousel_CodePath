//
//  PhotosViewController.swift
//  Carousel
//
//  Created by kevin grennan on 2/10/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIScrollViewDelegate {
    let defaults = NSUserDefaults.standardUserDefaults()
    @IBOutlet weak var timeWheel: UIScrollView!
    @IBOutlet weak var photosScroll: UIScrollView!
    @IBOutlet weak var photosImage: UIImageView!
    @IBOutlet weak var scrubber: UIImageView!
    @IBOutlet weak var scrubberHolder: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        timeWheel.delegate = self
        photosScroll.contentSize = photosImage.image!.size
        timeWheel.contentSize = scrubberHolder.frame.size
        defaults.setBool(false, forKey: "task1done")
        defaults.setBool(false, forKey: "task2done")
        defaults.setBool(false, forKey: "task3done")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photoButton(sender: AnyObject) {
        defaults.setBool(true, forKey: "task1done")
        defaults.synchronize()
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if timeWheel.contentOffset.x != 0{
        defaults.setBool(true, forKey: "task2done")
            defaults.synchronize()
        }
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
