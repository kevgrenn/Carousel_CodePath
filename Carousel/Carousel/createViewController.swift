//
//  createViewController.swift
//  Carousel
//
//  Created by kevin grennan on 2/11/16.
//  Copyright © 2016 kevin grennan. All rights reserved.
//

import UIKit

class createViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var textFieldParent: UIView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var termsCheckBox: UIButton!
    @IBOutlet weak var termsModal: UIButton!
    @IBOutlet weak var createButton: UIImageView!
    @IBOutlet weak var createScroll: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!

    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createScroll.delegate = self
        createScroll.contentSize = createScroll.frame.size
        createScroll.contentInset.bottom = 100
        
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -130
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func keyboardWillShow(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        createScroll.contentOffset.y = createScroll.contentInset.bottom
        

            }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
            }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if createScroll.contentOffset.y <= -50{
            view.endEditing(true)
        }

    }

    @IBAction func termsButton(sender: AnyObject) {
        if termsCheckBox.selected == true{
            termsCheckBox.selected = false
        }else{
        termsCheckBox.selected = true
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
