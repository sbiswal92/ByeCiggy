//
//  QuestionsViewController.swift
//  TrackProgress
//
//  Created by Biswal, Shruti [COM S] on 9/9/20.
//  Copyright © 2020 Biswal, Shruti [COM S]. All rights reserved.
//

import UIKit



class QuestionsViewController: UIViewController {
  
    let buttons = ["3", "5", "8","10", "12", "15", "18", "20"]
    let price = ["7.5", "8", "9", "10", "12", "15", "18", "20"]
    
    var buttonGrid: [UIButton]!
    var buttonSecondGrid: [UIButton]!
    var qlabel: UILabel!
    var q2label: UILabel!
    var selB1: UIButton?
    var selB2: UIButton?
    var nextButton: UIButton!
  
  
  func addButtons()
  {
    
    qlabel = UILabel()
    qlabel.translatesAutoresizingMaskIntoConstraints = false
    qlabel.font = UIFont(name: "Kefa-Regular", size: 18)
    qlabel.text = "How many cigarettes you smoke per day?"
    qlabel.numberOfLines = 0
    view.addSubview(qlabel)
    
    buttonGrid = [UIButton]()
    for i in 0..<buttons.count {
      let myB = UIButton(type: .custom)
      myB.translatesAutoresizingMaskIntoConstraints = false
      myB.backgroundColor = .white
      myB.titleLabel?.font = UIFont(name: "Kefa-Regular", size: 25)
      myB.setTitleColor(.black, for: .normal)
      myB.setTitle(buttons[i], for: .normal)
      myB.layer.masksToBounds = true
      myB.layer.cornerRadius = 6
      //myB.adjustsImageWhenHighlighted = false
      
      buttonGrid.append(myB)
      buttonGrid[i].addTarget(self, action: #selector(saveCount), for: .touchUpInside)
      view.addSubview(buttonGrid[i])
    }
    
    var lays0: [NSLayoutConstraint]
    lays0 = [
      
      qlabel.topAnchor.constraint(equalTo:view.layoutMarginsGuide.topAnchor, constant: 45),
      qlabel.leadingAnchor.constraint(equalTo:view.layoutMarginsGuide.leadingAnchor, constant:12),
      qlabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
      
    buttonGrid[0].topAnchor.constraint(equalTo:qlabel.bottomAnchor, constant: 25),
    buttonGrid[0].leadingAnchor.constraint(equalTo:view.layoutMarginsGuide.leadingAnchor, constant:25),
    buttonGrid[0].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
    
    buttonGrid[1].topAnchor.constraint(equalTo: qlabel.bottomAnchor, constant: 25),
    buttonGrid[1].leadingAnchor.constraint(equalTo: buttonGrid[0].trailingAnchor, constant: 5),
    buttonGrid[1].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
    
    buttonGrid[2].topAnchor.constraint(equalTo: qlabel.bottomAnchor, constant: 25),
    buttonGrid[2].leadingAnchor.constraint(equalToSystemSpacingAfter: buttonGrid[1].trailingAnchor, multiplier:1),
    buttonGrid[2].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
    ]
    
    var lays1: [NSLayoutConstraint]
    lays1 = [
          buttonGrid[3].topAnchor.constraint(equalToSystemSpacingBelow: buttonGrid[0].bottomAnchor, multiplier: 1),
          buttonGrid[3].leadingAnchor.constraint(equalTo: buttonGrid[0].leadingAnchor, constant: -15),
          buttonGrid[3].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28),
          
          buttonGrid[4].topAnchor.constraint(equalToSystemSpacingBelow: buttonGrid[0].bottomAnchor, multiplier: 1),
          buttonGrid[4].leadingAnchor.constraint(equalTo: buttonGrid[3].trailingAnchor, constant:10),
          buttonGrid[4].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28),
          
          buttonGrid[5].topAnchor.constraint(equalToSystemSpacingBelow: buttonGrid[0].bottomAnchor, multiplier:1),
          buttonGrid[5].leadingAnchor.constraint(equalTo: buttonGrid[4].trailingAnchor, constant:10),
          buttonGrid[5].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28)
    ]
    
    var lays2: [NSLayoutConstraint]
    lays2 = [
    buttonGrid[6].topAnchor.constraint(equalToSystemSpacingBelow: buttonGrid[3].bottomAnchor, multiplier: 1),
    buttonGrid[6].leadingAnchor.constraint(equalTo: buttonGrid[3].leadingAnchor, constant: 60),
    buttonGrid[6].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
    
    buttonGrid[7].topAnchor.constraint(equalToSystemSpacingBelow:  buttonGrid[3].bottomAnchor, multiplier: 1),
    buttonGrid[7].leadingAnchor.constraint(equalToSystemSpacingAfter: buttonGrid[6].trailingAnchor, multiplier:1),
    buttonGrid[7].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
    ]
    
    // Arrange the buttons to look good
    NSLayoutConstraint.activate(lays0+lays1+lays2)
  }
  
  func addSecondButtons()
   {
     
     q2label = UILabel()
     q2label.translatesAutoresizingMaskIntoConstraints = false
     q2label.font = UIFont(name: "Kefa-Regular", size: 18)
     q2label.text = "How much do you pay for one cigarette?"
     q2label.numberOfLines = 0
     view.addSubview(q2label)
     
     buttonSecondGrid = [UIButton]()
     for i in 0..<price.count {
       let myB = UIButton(type: .custom)
       myB.translatesAutoresizingMaskIntoConstraints = false
      myB.backgroundColor = .white
       myB.titleLabel?.font = UIFont(name: "Kefa-Regular", size: 25)
       myB.setTitleColor(.black, for: .normal)
       myB.setTitle((NSLocale(localeIdentifier: "en_IN").currencySymbol+" "+price[i]), for: .normal)
       myB.layer.masksToBounds = true
       myB.layer.cornerRadius = 6
       myB.adjustsImageWhenHighlighted = false
       buttonSecondGrid.append(myB)
       buttonSecondGrid[i].addTarget(self, action: #selector(savePrice), for: .touchUpInside)
       view.addSubview(buttonSecondGrid[i])
     }
     
     var lays0: [NSLayoutConstraint]
     lays0 = [
     
     q2label.topAnchor.constraint(equalTo:buttonGrid[7].bottomAnchor, constant: 45),
     q2label.leadingAnchor.constraint(equalTo:view.layoutMarginsGuide.leadingAnchor, constant: 20),
     q2label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
       
     buttonSecondGrid[0].topAnchor.constraint(equalTo:q2label.bottomAnchor, constant: 25),
     buttonSecondGrid[0].leadingAnchor.constraint(equalTo:view.layoutMarginsGuide.leadingAnchor, constant:25),
     buttonSecondGrid[0].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
     
     buttonSecondGrid[1].topAnchor.constraint(equalTo: q2label.bottomAnchor, constant: 25),
     buttonSecondGrid[1].leadingAnchor.constraint(equalTo: buttonSecondGrid[0].trailingAnchor, constant: 5),
     buttonSecondGrid[1].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
     
     buttonSecondGrid[2].topAnchor.constraint(equalTo: q2label.bottomAnchor, constant: 25),
     buttonSecondGrid[2].leadingAnchor.constraint(equalToSystemSpacingAfter: buttonSecondGrid[1].trailingAnchor, multiplier:1),
     buttonSecondGrid[2].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
     ]
     
     var lays1: [NSLayoutConstraint]
     lays1 = [
           buttonSecondGrid[3].topAnchor.constraint(equalToSystemSpacingBelow: buttonSecondGrid[0].bottomAnchor, multiplier: 1),
           buttonSecondGrid[3].leadingAnchor.constraint(equalTo: buttonSecondGrid[0].leadingAnchor, constant: -15),
           buttonSecondGrid[3].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28),
           
           buttonSecondGrid[4].topAnchor.constraint(equalToSystemSpacingBelow: buttonSecondGrid[0].bottomAnchor, multiplier: 1),
           buttonSecondGrid[4].leadingAnchor.constraint(equalTo: buttonSecondGrid[3].trailingAnchor, constant:10),
           buttonSecondGrid[4].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28),
           
           buttonSecondGrid[5].topAnchor.constraint(equalToSystemSpacingBelow: buttonSecondGrid[0].bottomAnchor, multiplier:1),
           buttonSecondGrid[5].leadingAnchor.constraint(equalTo: buttonSecondGrid[4].trailingAnchor, constant:10),
           buttonSecondGrid[5].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28)
     ]
     
     var lays2: [NSLayoutConstraint]
     lays2 = [
     buttonSecondGrid[6].topAnchor.constraint(equalToSystemSpacingBelow: buttonSecondGrid[3].bottomAnchor, multiplier: 1),
     buttonSecondGrid[6].leadingAnchor.constraint(equalTo: buttonSecondGrid[3].leadingAnchor, constant: 60),
     buttonSecondGrid[6].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
     
     buttonSecondGrid[7].topAnchor.constraint(equalToSystemSpacingBelow:  buttonSecondGrid[3].bottomAnchor, multiplier: 1),
     buttonSecondGrid[7].leadingAnchor.constraint(equalToSystemSpacingAfter: buttonSecondGrid[6].trailingAnchor, multiplier:1),
     buttonSecondGrid[7].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
     ]
     
     // Arrange the buttons to look good
     NSLayoutConstraint.activate(lays0+lays1+lays2)
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
    nextButton.setTitle("Next", for: .normal)
    nextButton.addTarget(self, action: #selector(moveNext), for: .touchUpInside)
    
    view.addSubview(nextButton)
    NSLayoutConstraint.activate([
      nextButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      nextButton.topAnchor.constraint(equalTo: buttonSecondGrid[7].bottomAnchor, constant:60),
      nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
    ])
    
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
        addButtons()
        addSecondButtons()
        addNextButton()
        
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
  
  @objc func saveCount(sender:UIButton) {
    if let b = selB1 {
      b.isSelected = false
      b.backgroundColor = sender.backgroundColor
    } else {
      print("Nothing previous")
    }
    sender.isSelected = true;
    selB1 = sender
    selB1?.showsTouchWhenHighlighted = true
    selB1?.backgroundColor = UIColor(red: 49.0/255.0, green: 91.0/255.0, blue: 174.0/255.0, alpha: 0.7)
  }
  
  
  @objc func savePrice(sender:UIButton) {
    if let b = selB2 {
         b.isSelected = false
         b.backgroundColor = sender.backgroundColor
       } else {
         print("Nothing previous")
    }
    sender.isSelected = true;
    selB2 = sender
    selB2?.showsTouchWhenHighlighted = true
    selB2?.backgroundColor = UIColor(red: 49.0/255.0, green: 91.0/255.0, blue: 174.0/255.0, alpha: 0.7)
  }
  
  @objc func moveNext() {
  }
  /*
  @objc func moveNext() {
   guard let vc = storyboard?.instantiateViewController(identifier: "Plan") as? GoalViewController else {return}
    
    if let x = selB1?.titleLabel?.text, !x.isEmpty {
      vc.count = x
    } else {
      let ac = UIAlertController(title: "Missing information", message: "Number of cigarettes not provided", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "Continue", style: .cancel))
      present(ac,animated:true)
      sleep(3)
      return
    }
    
    if let y = selB2?.titleLabel?.text, !y.isEmpty {
      vc.price = y
    } else {
      let ac = UIAlertController(title: "Missing information", message: "Price of cigarette not provided", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "Continue", style: .cancel))
      present(ac,animated:true)
      sleep(3)
      return
    }
    
    
  
    navigationController?.pushViewController(vc, animated: true)
  }
  
  */
  
}

