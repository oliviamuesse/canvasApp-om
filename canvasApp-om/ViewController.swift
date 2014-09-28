//
//  ViewController.swift
//  canvasApp-om
//
//  Created by Olivia Muesse on 9/24/14.
//  Copyright (c) 2014 Olivia Muesse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sadImage: UIImageView!
    @IBOutlet weak var goButton: UIButton!
    
    var imageCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Do linking in code
//        var panSadFaced = UIPanGestureRecognizer(target: self, action: "onPanSad:")
//        sadImage.addGestureRecognizer(panSadFaced)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func moveHead () {
        //headImage.transform = CGAffineTransform...
        sadImage.frame.origin.x = 200
        sadImage.transform = CGAffineTransformMakeScale(3,3)
        
    }
    
    @IBAction func onGoButton(sender: AnyObject) {
        UIView.animateWithDuration (0.3, animations: { () -> Void in
            self.moveHead()
            }) { (finished: Bool) -> Void in
                var angle = CGFloat(10 * M_PI / 180)
                self.sadImage.transform = CGAffineTransformRotate(self.sadImage.transform, angle)
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    
                    self.sadImage.transform = CGAffineTransformRotate(self.sadImage.transform, angle)
                    }, completion: nil)
                
               
        }
    }

    @IBAction func onPanSad(gestureRecognizer: UIPanGestureRecognizer){
        
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            println("pan began")
            imageCenter = sadImage.center
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            println("pan changed")
            println("translation \(translation)")
            
//            Alternative method of following the pan
//            sadImage.center.x = location.x
//            sadImage.center.y = location.y
            
            sadImage.center.x = translation.x + imageCenter.x
            sadImage.center.y = translation.y + imageCenter.y
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            println("pan ended")
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                if velocity.y < 0 {
                    self.sadImage.center.x = 200
                    self.sadImage.center.y = 40
                } else {
                    self.sadImage.center.x = 200
                    self.sadImage.center.y = 300
                }
            })
            
        }
    }
    
    @IBAction func onTapSad(sender: UITapGestureRecognizer) {
        println("tapped")
    }
}

