//
//  ParallaxCell.swift
//  app-listy
//
//  Created by Alexandre Gravelle on 2018-11-11.
//  Copyright © 2018 Alexandre Gravelle. All rights reserved.
//

import UIKit
import CoreMotion

class ParallaxCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupParallax()
    }
    
    func configureCell(withImage image: UIImage, andDescription desc: String) {
        itemImageView.image = image
        itemDescription.text = desc
    }

    func setupParallax() {
        let min = CGFloat(-30)
        let max = CGFloat(30)
        
        let trueXCenter = itemImageView.center.x
        let trueYCenter = itemImageView.center.y

        // Custom Parallax Effect
        
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            guard let accelerometerData = data else { return }
            
            var x: CGFloat = 0.0
            var y: CGFloat = 0.0
            
            if (self.itemImageView.center.x) <= (trueXCenter + max) && (self.itemImageView.center.x) >= (trueXCenter + min) {
                x = trueXCenter + CGFloat(30*(accelerometerData.acceleration.x))
            } else if (self.itemImageView.center.x) > (trueXCenter + max)  {
                self.itemImageView.center.x = trueXCenter + max
                return
            } else {
                self.itemImageView.center.x = trueXCenter + min
                return
            }
            
            if (self.itemImageView.center.y) <= (trueYCenter + max) && (self.itemImageView.center.y) >= (trueYCenter + min) {
                y = trueYCenter + CGFloat(30*(accelerometerData.acceleration.y))
            } else if (self.itemImageView.center.y) > (trueYCenter + max)  {
                self.itemImageView.center.y = trueYCenter + max
                return
            } else {
                self.itemImageView.center.y = trueYCenter + min
                return
            }
            
            print("X: \(x) Y: \(y)")
            
            self.itemImageView.center.x = x
            self.itemImageView.center.y = y
            
        }
        
        // Parallax Effect using UIInterpolatingMotionEffect
        
//        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
//        xMotion.minimumRelativeValue = min
//        xMotion.maximumRelativeValue = max
//
//        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
//        yMotion.minimumRelativeValue = min
//        yMotion.maximumRelativeValue = max
//
//        let motionEffectGroup = UIMotionEffectGroup()
//        motionEffectGroup.motionEffects = [xMotion, yMotion]
//
//        itemImageView.addMotionEffect(motionEffectGroup)
        
    }

}
