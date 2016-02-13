//
//  LearningViewController.swift
//  Carousel
//
//  Created by kevin grennan on 2/13/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class LearningViewController: UIViewController {
    @IBOutlet weak var task1: UIButton!
    @IBOutlet weak var task2: UIButton!
    @IBOutlet weak var task3: UIButton!
    var task1state :Bool = false
    var task2state :Bool = false
    var task3state :Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
            task1state = NSUserDefaults.standardUserDefaults().boolForKey("task1done")
            task2state = NSUserDefaults.standardUserDefaults().boolForKey("task2done")
            task3state = NSUserDefaults.standardUserDefaults().boolForKey("task3done")
            task1.selected = false
            task2.selected = false
            task3.selected = false
            if task1state == true{
            task1.selected = true
            }
            if task2state == true{
            task2.selected = true
            }
            if task3state == true{
            task3.selected = true}
            
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
    @IBAction func backToPhotos(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
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
