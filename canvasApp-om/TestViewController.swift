//
//  TestViewController.swift
//  canvasApp-om
//
//  Created by Olivia Muesse on 9/27/14.
//  Copyright (c) 2014 Olivia Muesse. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var sadView: UIImageView!
    @IBOutlet weak var goButtton: UIButton!
    
    var imageCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func chargeSad() {
        sadView.frame.origin.y = 300
        sadView.transform = CGAffineTransformMakeScale(2, 2
            )
    }
    
    @IBAction func onGoButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.chargeSad()
            }) { (finished: Bool) -> Void in
                var angle = CGFloat(-10 * M_PI/180)
                self.sadView.transform = CGAffineTransformRotate(self.sadView.transform, angle)
                UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.CurveEaseInOut , animations: { () -> Void in
                    var angle = CGFloat (20 * M_PI/180)
                    self.sadView.transform = CGAffineTransformRotate(self.sadView.transform, angle)
                    }, completion: nil)
            }
        }

    @IBAction func onTapHead(sender: UITapGestureRecognizer) {
        println("tapped")
    }
    
    @IBAction func onPanHead(gestureRecognizer: UIPanGestureRecognizer) {
        
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            imageCenter = sadView.center
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            sadView.center.x = translation.x + imageCenter.x
            sadView.center.y = translation.y + imageCenter.y
            println("translation \(translation)")
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                //if you are panning upward y < 0
                // if you are panning right x < 0
                if velocity.y < 0 {
                    self.sadView.center.x = 200
                    self.sadView.center.y = 40
                } else {
                    self.sadView.center.x = 200
                    self.sadView.center.y = 300
                }
            })
        }
    }

}
