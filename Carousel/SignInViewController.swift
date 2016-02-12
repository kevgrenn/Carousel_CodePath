//
//  SignInViewController.swift
//  Carousel
//
//  Created by kevin grennan on 2/10/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var signScroll: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signScroll.delegate = self
        signScroll.contentSize = signScroll.frame.size
        signScroll.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
            // Set initial transform values 20% of original size
            let transform = CGAffineTransformMakeScale(0.2, 0.2)
            // Apply the transform properties of the views
            loginNavBar.transform = transform
            fieldParentView.transform = transform
            // Set the alpha properties of the views to transparent
            loginNavBar.alpha = 0
            fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }

    @IBAction func signInButton(sender: AnyObject) {
        activityIndicator.startAnimating()
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty{
        
        let alertController  = UIAlertController(title: "Email Required", message: "Please enter your email address.", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            presentViewController(alertController, animated: true){
            }
            self.activityIndicator.stopAnimating()
        }else if emailField.text == "email" && passwordField.text == "password"{
            delay(2, closure: { () -> () in
                self.activityIndicator.stopAnimating()
                self.performSegueWithIdentifier("signInSegue", sender: nil)
                
            })
        }else{
            delay(2, closure: { () -> () in
                self.activityIndicator.stopAnimating()
                let failController  = UIAlertController(title: "Sign In Failed", message: "Incorrect email or password.", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                }
                failController.addAction(cancelAction)
                self.presentViewController(failController, animated: true){
                }

                
            })
            
        }
    }


    func keyboardWillShow(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        signScroll.contentOffset.y = signScroll.contentInset.bottom
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
    }
 
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if signScroll.contentOffset.y <= -50{
            view.endEditing(true)
            
        }
    }

    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
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
