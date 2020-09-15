//
//  PickerViewController.swift
//  TrackProgress
//
//  Created by Biswal, Shruti [COM S] on 9/12/20.
//  Copyright © 2020 Biswal, Shruti [COM S]. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {

  @IBOutlet weak var countPicker: UIPickerView!
  @IBOutlet weak var pricePicker: UIPickerView!
  
  let countLimit = 40
  let priceLimit = 30
  var qlabel: UILabel!
  var q2label: UILabel!
  var nextButton: UIButton!
  
  var countModelPicker:CountModelPicker!
  var priceModelPicker:CountModelPicker!
  
  func getCountData()->[String]{
    var arr = [String]()
    for i in 1...countLimit {
      arr.append(String(i))
    }
    
    return arr
  }
  
  func getPriceData()->[String]{
    var arr = [String]()
    for i in 1...priceLimit {
      arr.append(String(i))
    }
    
    return arr
  }
  
  func addUISettings()
  {
    qlabel = UILabel()
    qlabel.translatesAutoresizingMaskIntoConstraints = false
    qlabel.font = UIFont(name: "Kefa-Regular", size: 18)
    qlabel.text = "How many cigarettes you smoke per day?"
    qlabel.numberOfLines = 0
    view.addSubview(qlabel)
    
    q2label = UILabel()
    q2label.translatesAutoresizingMaskIntoConstraints = false
    q2label.font = UIFont(name: "Kefa-Regular", size: 18)
    q2label.text = "How much do you pay for one cigarette?"
    q2label.numberOfLines = 0
    view.addSubview(q2label)
    
    NSLayoutConstraint.activate([
      qlabel.topAnchor.constraint(equalTo:view.layoutMarginsGuide.topAnchor, constant: 130),
      qlabel.leadingAnchor.constraint(equalTo:view.layoutMarginsGuide.leadingAnchor, constant:12),
      qlabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:40),
      
      countPicker.topAnchor.constraint(equalTo:qlabel.bottomAnchor, constant: -30),
      countPicker.leadingAnchor.constraint(equalTo:view.layoutMarginsGuide.leadingAnchor, constant:100),
      countPicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
      countPicker.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier:0.13),

           
      q2label.topAnchor.constraint(equalTo:countPicker.bottomAnchor, constant: -30),
      q2label.leadingAnchor.constraint(equalTo:view.layoutMarginsGuide.leadingAnchor, constant: 12),
      q2label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 40),
      
      pricePicker.topAnchor.constraint(equalTo:q2label.bottomAnchor, constant: -100),
      pricePicker.leadingAnchor.constraint(equalTo:view.layoutMarginsGuide.leadingAnchor, constant:1),
      pricePicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
      pricePicker.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier:0.13)
    ])
  }
  
  func addNextButton(){
    nextButton = UIButton(type: .custom)
    nextButton.translatesAutoresizingMaskIntoConstraints = false
    nextButton.backgroundColor = .systemIndigo
    nextButton.titleLabel?.font = UIFont(name: "Kefa-Regular", size: 25)
    nextButton.setTitleColor(.white, for: .normal)
    nextButton.layer.masksToBounds = true
    nextButton.layer.cornerRadius = 6
    nextButton.isHidden = false
    /*
    nextButton.setImage(UIImage(named:"logo_small"), for: .normal)
    nextButton.imageView?.contentMode = .scaleAspectFit
    nextButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 34)
    nextButton.imageEdgeInsets = UIEdgeInsets(top: 6, left: 100, bottom: 6, right: 14)
    */
    nextButton.setTitle("Next", for: .normal)
    
    nextButton.addTarget(self, action: #selector(moveNext), for: .touchUpInside)
    
    view.addSubview(nextButton)
    NSLayoutConstraint.activate([
     // nextButton.centerXAnchor.constraint(equalTo: pricePicker.centerXAnchor),
      nextButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.layoutMarginsGuide.leadingAnchor, multiplier: 12),
      nextButton.topAnchor.constraint(equalTo: pricePicker.bottomAnchor, constant:60),
      nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
    ])
    
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
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    setGradientBackground()
    
    countModelPicker = CountModelPicker()
    countModelPicker.modelData = getCountData()
    countModelPicker.isCurr = false
    
    priceModelPicker = CountModelPicker()
    priceModelPicker.modelData = getPriceData()
    priceModelPicker.isCurr = true
    
    countPicker.delegate = countModelPicker
    countPicker.dataSource = countModelPicker
    
    
    pricePicker.delegate = priceModelPicker
    pricePicker.dataSource = priceModelPicker
    
    addUISettings()
    addNextButton()
    
    }
    
  
  @objc func moveNext() {
    guard let vc = storyboard?.instantiateViewController(identifier: "card") as? CardViewController else {return}
    
    vc.count = countModelPicker.chosenData
    vc.price = priceModelPicker.chosenData
    
    
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
