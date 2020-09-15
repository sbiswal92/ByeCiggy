//
//  CardViewController.swift
//  TrackProgress
//
//  Created by Biswal, Shruti [COM S] on 9/13/20.
//  Copyright © 2020 Biswal, Shruti [COM S]. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    var bannerImage = [UIImage(named:"1"),UIImage(named:"2"),UIImage(named:"3"),UIImage(named:"4")]
    var bannerColor = [
    UIColor(displayP3Red: 255.0/255.0, green: 222.0/255.0, blue: 89.0/255.0, alpha: 1),
    UIColor(displayP3Red: 255.0/255.0, green: 145.0/255.0, blue: 77.0/255.0, alpha: 1),
    UIColor(displayP3Red: 166/255.0, green: 166.0/255.0, blue: 166.0/255.0, alpha: 1),
    UIColor(displayP3Red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)]
  
    var progDays = [7, 15, 30, 90]
    var progTgt:[Float]!
    var progTitle:[String]!
    
    var price: String?
    var count: String?
    
    func buildPrograms() {
      
      let countPerDay = Int(count ?? "0")
      let costPerCig = Float(price ?? "0.0")
      progTgt = [Float]()
      progTitle = [String]()
      
      for d in progDays {
        let tgt = Float(d) * Float(countPerDay ?? 0) * (costPerCig ?? 0)
        var title:String = ""
        
        if tgt <= 100 {
          title = "Great work. Keep saving more!"
        } else if tgt <= 300 {
          title = "Buy your favorite ice-cream and treat yourself. Save more with by extending program"
        } else if tgt <= 1000 {
          title = "Save yourself a one-month subscription of NetFlix."
        } else if tgt <= 2000 {
          title = "Thats your typical bill for two weeks' groceries."
        } else if tgt <= 5000 {
          title = "Get that quick getaway to your nearest resort."
        } else if tgt <= 15000 {
          title = "Save towards that gadget you have been planning."
        } else if tgt <= 35000 {
          title = "Plan that trip you have been thinking about."
        }
        progTgt.append(tgt)
        progTitle.append(title)
      }
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
        buildPrograms()
        
    }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return progDays.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
    
    cell.backgroundColor = bannerColor[indexPath.row]
    cell.bannerProgLength.text = String(progDays[indexPath.row]) + "-Day Program"
    cell.bannerProgTarget.text = NSLocale(localeIdentifier: "en_IN").currencySymbol + " " + String(progTgt[indexPath.row])
    cell.bannerProgDesc.text =  String(progTitle[indexPath.row])
    
    
    cell.contentView.layer.cornerRadius = 9.0
    cell.contentView.layer.borderWidth = 1.0
    cell.contentView.layer.borderColor = UIColor.clear.cgColor
    cell.contentView.layer.masksToBounds = false
    cell.layer.shadowColor = UIColor.gray.cgColor
    cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
    cell.layer.shadowRadius = 9.0
    cell.layer.shadowOpacity = 1.0
    cell.layer.masksToBounds = false
    cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    
    return cell
  }
    
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
  {
    return CGSize(width: 325, height: 150)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let vc = storyboard?.instantiateViewController(identifier: "finalPage") as? GoalViewController
    else {return}
    
    vc.target = progTgt[indexPath.row]
    vc.price = Float(price ?? "0.0")
    
    navigationController?.pushViewController(vc, animated: true)
  }

}
