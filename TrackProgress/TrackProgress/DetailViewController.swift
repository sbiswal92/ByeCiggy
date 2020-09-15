//
//  DetailViewController.swift
//  TrackProgress
//
//  Created by Biswal, Shruti [COM S] on 9/3/20.
//  Copyright © 2020 Biswal, Shruti [COM S]. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet var trachea: UIImageView!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var imageViewR: UIImageView!
  var fullL: Int?
  var inc: Int?
  
  var colors = [(168, 55, 50), (181, 73, 69), (199, 95, 95), (206, 105, 108), (235, 148, 151)]
  
  let tot:CGFloat = 255
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    trachea.image = UIImage(named:"3")
    
    let img = UIImage(named: "1")
    let templateImage = img?.withRenderingMode(.alwaysTemplate)
    
    imageView.image = templateImage
    imageViewR.image = templateImage?.withHorizontallyFlippedOrientation()
    
    let that_col = colors[Int(100/fullL!)]
    imageView.tintColor = UIColor(displayP3Red: CGFloat(that_col.0)/tot, green: CGFloat(that_col.1)/tot, blue: CGFloat(that_col.2)/tot, alpha: 1)
    
    imageViewR.tintColor = UIColor(displayP3Red: CGFloat(that_col.0)/tot, green: CGFloat(that_col.1)/tot, blue: CGFloat(that_col.2)/tot, alpha: 1)
    
    
    view.addSubview(imageView)
    view.addSubview(imageViewR)
    
        
  }
  
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
