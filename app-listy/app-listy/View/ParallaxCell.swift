//
//  ParallaxCell.swift
//  app-listy
//
//  Created by Alexandre Gravelle on 2018-11-11.
//  Copyright © 2018 Alexandre Gravelle. All rights reserved.
//

import UIKit

class ParallaxCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
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
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion, yMotion]
        
        itemImageView.addMotionEffect(motionEffectGroup)
    }

}
