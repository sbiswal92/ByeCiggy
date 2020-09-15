//
//  GoalViewController.swift
//  TrackProgress
//
//  Created by Biswal, Shruti [COM S] on 9/12/20.
//  Copyright © 2020 Biswal, Shruti [COM S]. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController {

    var price: Float!
    var target: Float!
  
  //var myButton: UIButton!

  @IBOutlet weak var animaImg: UIImageView!
  var velkomstImgList = [UIImage]()
  
  override func viewDidAppear(_ animated: Bool) {
    animaImg.frame = CGRect(x: 0, y: 0, width: 0.8*self.view.frame.width, height: 200)
    animaImg.contentMode = .scaleAspectFill
    view.addSubview(animaImg)
    
    /*
    myButton = UIButton(type: .custom)
    myButton.translatesAutoresizingMaskIntoConstraints = true
    myButton.backgroundColor = .systemIndigo
    myButton.titleLabel?.font = UIFont(name: "Kefa-Regular", size: 25)
    myButton.setTitleColor(.white, for: .normal)
    myButton.layer.masksToBounds = true
    myButton.layer.cornerRadius = 6
    myButton.isHidden = false
    myButton.setTitle("Add money", for: .normal)
    myButton.addTarget(self, action: #selector(animateVelkomst), for: .touchUpInside)
    
    view.addSubview(myButton)
    */
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(animateVelkomst))
    
  }
  
 @objc func animateVelkomst() {
  for i in 1...15 {
      velkomstImgList.append(UIImage(named:"\(i).png")!)
      if i == 15 {
          self.animaImg.image = UIImage(named:"15.png")
          self.animaImg.animationImages = self.velkomstImgList
          self.animaImg.animationDuration = 3.0
          self.animaImg.animationRepeatCount = 1
          self.animaImg.startAnimating()
      }
    }
    velkomstImgList.removeAll()
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func setGradientBackground() {
          let colorTop =  UIColor(red: 202.0/255.0, green: 246.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
          let colorBottom = UIColor(red: 73.0/255.0, green: 156.0/255.0, blue: 248.0/255.0, alpha: 1.0).cgColor
                      
          let gradientLayer = CAGradientLayer()
          gradientLayer.colors = [colorTop, colorBottom]
          gradientLayer.locations = [0.0, 1.0]
          gradientLayer.frame = self.view.bounds
                  
          self.view.layer.insertSublayer(gradientLayer, at:0)
      }
    
    
    override func viewWillAppear(_ animated: Bool) {
          setGradientBackground()
          super.viewWillAppear(animated)
      }
}
