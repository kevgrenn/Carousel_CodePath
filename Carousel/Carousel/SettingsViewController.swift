//
//  SettingsViewController.swift
//  Carousel
//
//  Created by kevin grennan on 2/10/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsScroll: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsScroll.contentSize = settingsImage.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingsButton(sender: AnyObject) {
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func logOutButton(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "", message: "Are you sure you want to Log Out", preferredStyle: .ActionSheet)
        
        let logOutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("signOutSegue", sender: self)
        }
        
        alertController.addAction(logOutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            
        }
        
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true) {
            
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
