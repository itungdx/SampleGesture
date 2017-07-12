//
//  ViewController.swift
//  SampleGesture
//
//  Created by Tung on 6/26/17.
//  Copyright © 2017 Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.onTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    func onTap(_ tapGesture: UITapGestureRecognizer)
    {
        let point = tapGesture.location(in: self.view)
        let snowFlake = UIImageView(image: UIImage(named: "snowflake.png"))
        snowFlake.bounds.size = CGSize(width: 40, height: 40)
        snowFlake.center = point;
        self.view.addSubview(snowFlake)
        
    }


}

