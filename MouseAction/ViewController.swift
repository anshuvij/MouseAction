//
//  ViewController.swift
//  MouseAction
//
//  Created by Anshu Vij on 1/20/20.
//  Copyright © 2020 Anshu Vij. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var mouseSwipped = false
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let touch = touches.first else {
        return
      }
      mouseSwipped = false
      lastPoint = touch.location(in: view)
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
      
      UIGraphicsBeginImageContext(view.frame.size)
      guard let context = UIGraphicsGetCurrentContext() else {
        return
      }
      tempImageView.image?.draw(in: view.bounds)
        
     
      context.move(to: fromPoint)
      context.addLine(to: toPoint)
      
      
      context.setLineCap(.round)
      context.setBlendMode(.normal)
      context.setLineWidth(brushWidth)
      context.setStrokeColor(color.cgColor)
      
      
      context.strokePath()
      
     
      tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
      tempImageView.alpha = opacity
      UIGraphicsEndImageContext()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let touch = touches.first else {
        return
      }

     
      mouseSwipped = true
      let currentPoint = touch.location(in: view)
      drawLine(from: lastPoint, to: currentPoint)
        
      
      lastPoint = currentPoint
    }


}

