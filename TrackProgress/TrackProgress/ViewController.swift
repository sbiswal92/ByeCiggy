//
//  ViewController.swift
//  TrackProgress
//
//  Created by Biswal, Shruti [COM S] on 9/3/20.
//  Copyright © 2020 Biswal, Shruti [COM S]. All rights reserved.
//

import UIKit

/*
class ViewController: UITableViewController {

  var maxLimits = [200, 100, 50, 30, 25]
  var increment = 15
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return maxLimits.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let vc = tableView.dequeueReusableCell(withIdentifier: "Limit", for: indexPath)
    vc.textLabel?.text = String(maxLimits[indexPath.row])
    return vc
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Progress") as? DetailViewController {
      vc.fullL = maxLimits[indexPath.row]
      vc.inc = increment
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}
*/

class ViewController: UIViewController {
  
  var planLabel: UILabel!
  var targetLabel: UILabel!
  
  var inputPlan: UITextField!
  var inputTarget: UITextField!
  
  var submitTask: UIButton!
  
  @IBOutlet var ImgWall: UIImageView!
  @IBOutlet var myImgView: UIImageView!
  @IBOutlet var myImgBck: UIImageView!
  
  var inc: UIButton!
  var incValue: UILabel!
  var savedSoFar: UILabel!
  var savedLabel: UILabel!
  
  var rcol: CGFloat!
  var gcol: CGFloat!
  var bcol: CGFloat!
  var tot: CGFloat =  255
  
  var trackColorChange = 0
  var whichIdx = 0
  
  let colorArray : [(CGFloat,CGFloat,CGFloat)] = [(86,3,25),(128,0,32),(195,33,72),(224,17,95),(227,11,93),(222,49,99),(222,93,131),(231,84,128),(252,142,172),(255,183,197),(255,192,203),(255,209,220)]
  
  override func loadView() {
       view = UIView()
    view.backgroundColor = .white
       
       rcol = colorArray[0].0
       gcol = colorArray[0].1
       bcol = colorArray[0].2
        
       /*let imgWall = UIImage(named: "1")
       let templateImageWall = imgWall?.withRenderingMode(.alwaysOriginal)
       ImgWall = UIImageView(image: templateImageWall)
       ImgWall.translatesAutoresizingMaskIntoConstraints = false
       ImgWall.isHidden = false
       view.addSubview(ImgWall)*/
      
       planLabel = UILabel()
       planLabel.translatesAutoresizingMaskIntoConstraints = false
       planLabel.font = UIFont(name: "Charter-Roman", size: 26)
       planLabel.textColor = .white
       planLabel.text = "Plan"
       planLabel.numberOfLines = 0
       planLabel.textAlignment = .center
       planLabel.backgroundColor = UIColor(displayP3Red: CGFloat(237/tot), green: CGFloat(93/tot), blue: CGFloat(22/tot), alpha: 1)
       planLabel.layer.masksToBounds = true
       planLabel.layer.cornerRadius = 6
       view.addSubview(planLabel)
    

       targetLabel = UILabel()
       targetLabel.translatesAutoresizingMaskIntoConstraints = false
       targetLabel.font = UIFont(name: "Charter-Roman", size: 26)
       targetLabel.textColor = .white
       targetLabel.text = "Target"
       targetLabel.numberOfLines = 0
       targetLabel.textAlignment = .center
       targetLabel.backgroundColor = UIColor(displayP3Red: CGFloat(237/tot), green: CGFloat(93/tot), blue: CGFloat(22/tot), alpha: 1)
       targetLabel.layer.masksToBounds = true
       targetLabel.layer.cornerRadius = 6
       view.addSubview(targetLabel)
    
    
       inputPlan = UITextField()
       inputPlan.translatesAutoresizingMaskIntoConstraints = false
       inputPlan.placeholder = "Travel, Buy camera etc"
       inputPlan.textAlignment = .left
       inputPlan.font = UIFont(name: "Charter-Roman", size: 20)
       inputPlan.isUserInteractionEnabled = true
       view.addSubview(inputPlan)
    
       inputTarget = UITextField()
       inputTarget.translatesAutoresizingMaskIntoConstraints = false
       inputTarget.placeholder = "20000"
       inputTarget.textAlignment = .left
       inputTarget.font = UIFont(name: "Charter-Roman", size: 20)
       inputTarget.isUserInteractionEnabled = true
       view.addSubview(inputTarget)
    
       submitTask = UIButton(type: .roundedRect)
       submitTask.translatesAutoresizingMaskIntoConstraints = false
       submitTask.backgroundColor = .systemIndigo
       submitTask.titleLabel?.font = UIFont(name: "Charter-Roman", size: 20)
       submitTask.setTitleColor(.white, for: .normal)
       submitTask.setTitle("Create Goal", for: .normal)
       view.addSubview(submitTask)
    
      
       let img1 = UIImage(named: "circle")
       let templateImage1 = img1?.withRenderingMode(.alwaysOriginal)
       myImgBck = UIImageView(image: templateImage1)
       myImgBck.translatesAutoresizingMaskIntoConstraints = false
       myImgBck.isHidden = true
       view.addSubview(myImgBck)
       
    
       let img = UIImage(named: "lungs")
       let templateImage = img?.withRenderingMode(.alwaysTemplate)
       myImgView = UIImageView(image: templateImage)
       myImgView.translatesAutoresizingMaskIntoConstraints = false
       myImgView.isHidden = true
       myImgView.tintColor = UIColor(displayP3Red: rcol/tot, green: gcol/tot, blue: bcol/tot, alpha: 1)
       view.addSubview(myImgView)
    
       
       incValue = UILabel()
       incValue.translatesAutoresizingMaskIntoConstraints = false
       incValue.font = UIFont(name: "Charter-Roman", size: 20)
       incValue.text = "15"
       incValue.numberOfLines = 0
       incValue.isHidden = true
       view.addSubview(incValue)
    
       savedLabel = UILabel()
       savedLabel.translatesAutoresizingMaskIntoConstraints = false
       savedLabel.font = UIFont(name: "Charter-Roman", size: 20)
       savedLabel.text = "Saved:"
       savedLabel.numberOfLines = 0
       savedLabel.isHidden = true
       view.addSubview(savedLabel)
        
       savedSoFar = UILabel()
       savedSoFar.translatesAutoresizingMaskIntoConstraints = false
       savedSoFar.font = UIFont(name: "Charter-Roman", size: 20)
       savedSoFar.text = "0"
       savedSoFar.numberOfLines = 0
       savedSoFar.isHidden = true
       view.addSubview(savedSoFar)
    
       inc = UIButton(type: .roundedRect)
       inc.translatesAutoresizingMaskIntoConstraints = false
       inc.backgroundColor = .systemIndigo
       inc.titleLabel?.font = UIFont(name: "Charter-Roman", size: 15)
       inc.setTitleColor(.white, for: .normal)
       inc.setTitle("+", for: .normal)
       inc.isHidden = true
       view.addSubview(inc)
       
       
       NSLayoutConstraint.activate([
          
          planLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.layoutMarginsGuide.topAnchor, multiplier: 5),
          planLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.layoutMarginsGuide.leadingAnchor, multiplier:5),
          planLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
          
          inputPlan.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 35),
          inputPlan.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
          inputPlan.topAnchor.constraint(equalTo: planLabel.topAnchor, constant: 1),
           
          targetLabel.topAnchor.constraint(equalTo: planLabel.bottomAnchor, constant: 20),
          targetLabel.leadingAnchor.constraint(equalTo: planLabel.leadingAnchor),
          targetLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
                  
          
          inputTarget.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 35),
          inputTarget.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
          inputTarget.topAnchor.constraint(equalTo: targetLabel.topAnchor, constant: 1),
           
          submitTask.topAnchor.constraint(equalToSystemSpacingBelow: targetLabel.bottomAnchor, multiplier: 3),
          submitTask.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          submitTask.heightAnchor.constraint(equalToConstant: 50),
          submitTask.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
             
          myImgBck.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
          myImgBck.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.2),
          myImgBck.topAnchor.constraint(equalTo: submitTask.bottomAnchor, constant: -65),
          myImgBck.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          
          
          myImgView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
          myImgView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.1),
          myImgView.topAnchor.constraint(equalTo: submitTask.bottomAnchor, constant: -10),
          myImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          
          savedLabel.topAnchor.constraint(equalTo: myImgView.bottomAnchor, constant: -60),
          savedLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.layoutMarginsGuide.leadingAnchor, multiplier:16),
          savedSoFar.topAnchor.constraint(equalTo: myImgView.bottomAnchor, constant: -60),
          savedSoFar.leadingAnchor.constraint(equalToSystemSpacingAfter: savedLabel.trailingAnchor, multiplier: 1),
          
          incValue.topAnchor.constraint(equalToSystemSpacingBelow: savedLabel.bottomAnchor, multiplier: 1.5),
          incValue.leadingAnchor.constraint(equalToSystemSpacingAfter: view.layoutMarginsGuide.leadingAnchor, multiplier:18),
          inc.topAnchor.constraint(equalToSystemSpacingBelow: savedSoFar.bottomAnchor, multiplier: 1),
          inc.leadingAnchor.constraint(equalToSystemSpacingAfter: incValue.trailingAnchor, multiplier: 1),
          
       ])
    
    submitTask.addTarget(self, action: #selector(submitGoal), for: .touchUpInside)
    inc.addTarget(self, action: #selector(incSaving), for: .touchUpInside)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let backgroundImageView = UIImageView(image: UIImage(named:"1"), highlightedImage:nil)
    self.view.insertSubview(backgroundImageView, at: 0)
   
  }
  
  @objc func submitGoal(){
    /*guard let vc = storyboard?.instantiateViewController(identifier: "Progress") as? DetailViewController else {return}
    guard let tgt = inputTarget?.text else {return}
    vc.fullL = Int(tgt)
    vc.inc = 15
    present(vc, animated:true)
  }*/
    
    myImgView.isHidden = false
    myImgBck.isHidden = false
    savedLabel.isHidden = false
    savedSoFar.isHidden = false
    incValue.isHidden = false
    inc.isHidden = false
    //present(self, animated: true)
  }
  
  @objc func incSaving(){
    
    guard let tgt = inputTarget?.text else {return}
    let tgt1 = Int(tgt)!
    let save = savedSoFar?.text ?? "0"
    let save1 = Int(save)!
    let incVal = incValue?.text ?? "0"
    let incVal1 = Int(incVal)!
    
    let howManyParts = tgt1/incVal1
    let changeColorAfter = howManyParts/12
    
    rcol = colorArray[1].0
    gcol = colorArray[1].1
    bcol = colorArray[1].2
    
    /*trackColorChange += 1
    print("\(trackColorChange)")
    
    if trackColorChange == changeColorAfter {
      rcol = colorArray[whichIdx].0
      gcol = colorArray[whichIdx].1
      bcol = colorArray[whichIdx].2
      trackColorChange = 0
      whichIdx += 1
    }*/
    
    savedSoFar.text = String(save1 + incVal1)
    myImgView.tintColor = UIColor(displayP3Red: rcol/tot, green: gcol/tot, blue: bcol/tot, alpha: 1)
    
  }
  
}
