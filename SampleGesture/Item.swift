//
//  Item.swift
//  SampleGesture
//
//  Created by Tung on 6/26/17.
//  Copyright © 2017 Tung. All rights reserved.
//

import  UIKit
class Item : UIImageView, UIGestureRecognizerDelegate{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    func setup()
    {
        //on off multiple touch
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(Item.onPan(panGesture:)))
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(Item.pinchPhoto(_:)))
        self.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(Item.rotateItem(rotateGestrureRecognizer:)))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
    }
    func onPan(panGesture: UIPanGestureRecognizer)
    {
        if (panGesture.state == .began || panGesture.state == .changed) {
            let point  = panGesture.location(in: self.superview)
            self.center = point
        }
    }
    //Zoom in and Zoom Out
    func pinchPhoto(_ pinchGestrureRecognizer: UIPinchGestureRecognizer)
    {
        //        self.adjustAnchorPointForGestureRecognizer(pinchGestrureRecognizer)
        if let view = pinchGestrureRecognizer.view
        {
            view.transform = view.transform.scaledBy(x: pinchGestrureRecognizer.scale, y: pinchGestrureRecognizer.scale)
            //nham muc dich phong lon theo kich thuoc dau tien chu ko phai phong lon theo kich thuoc dang co
            pinchGestrureRecognizer.scale = 1
        }
    }
    func rotateItem(rotateGestrureRecognizer: UIRotationGestureRecognizer){
        if let view = rotateGestrureRecognizer.view
        {
            view.transform = view.transform.rotated(by: rotateGestrureRecognizer.rotation)
            //Tuong tu voi phong lon
            rotateGestrureRecognizer.rotation = 0
        }
    }
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizer: UIGestureRecognizer)-> Bool{
        return true
    }
}

