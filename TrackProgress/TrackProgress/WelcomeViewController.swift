//
//  WelcomeViewController.swift
//  TrackProgress
//
//  Created by Biswal, Shruti [COM S] on 9/9/20.
//  Copyright © 2020 Biswal, Shruti [COM S]. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet var pageCtrl: UIPageControl!
  
  
  @IBOutlet var nextButton: UIButton!
  
  var slides:[Slide] = [];
  let colors = Colors()
  
  func createSlides() -> [Slide] {

      let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
      slide1.imageView.image = UIImage(named: "slide1")
      slide1.labelTitle.text = "Monitor smoking urges"
      slide1.labelTitle.font = UIFont(name: "Kefa-Regular", size: 20)
      slide1.backgroundColor = .clear
      
      let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
      slide2.imageView.image = UIImage(named: "slide2")
      slide2.labelTitle.text = "Turn your cravings into savings"
      slide2.labelTitle.font = UIFont(name: "Kefa-Regular", size: 20)
      slide2.backgroundColor = .clear
      
      let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
      slide3.imageView.image = UIImage(named: "slide3")
      slide3.labelTitle.text = "Heal your lungs"
      slide3.labelTitle.font = UIFont(name: "Kefa-Regular", size: 20)
      slide3.backgroundColor = .clear
      
      
      return [slide1, slide2, slide3]
  }
  
  func setupSlideScrollView(slides : [Slide]) {
    
      scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height-40)
      scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: scrollView.frame.height)
      scrollView.isPagingEnabled = true
      
      for i in 0 ..< slides.count {
          slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
          scrollView.addSubview(slides[i])
      }
    
      
  }
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = .systemIndigo
        nextButton.titleLabel?.font = UIFont(name: "Kefa-Regular", size: 25)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.masksToBounds = true
        nextButton.layer.cornerRadius = 6
        nextButton.isHidden = true
        nextButton.addTarget(self, action: #selector(skipToIntro), for: .touchUpInside)
    
    
        scrollView.delegate = self
        slides = createSlides()
        setupSlideScrollView(slides: slides)
    
        pageCtrl.numberOfPages = slides.count
        pageCtrl.currentPage = 0
        pageCtrl.currentPageIndicatorTintColor = UIColor(red: 0.0/255.0, green: 74.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        pageCtrl.pageIndicatorTintColor = .white
        //view.addSubview(skipButton)
        view.addSubview(nextButton)
    
        view.addSubview(pageCtrl)
        view.bringSubviewToFront(pageCtrl)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style:.plain, target: self, action: #selector(nextPage))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Skip", style:.plain, target: self, action: #selector(skipToIntro))
    
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
  
  @objc func skipToIntro(){
   guard let vc = storyboard?.instantiateViewController(identifier: "InitialQuestions") as? PickerViewController else {return}
    navigationController?.pushViewController(vc, animated: true)
    
  }
  
  @objc func nextPage(){
    
    pageCtrl.currentPage += 1
    scrollView.setContentOffset(CGPoint(x: view.frame.width * CGFloat(pageCtrl.currentPage), y: 0), animated: true)
      if pageCtrl.currentPage == 2 {
        nextButton.isHidden = false
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.leftBarButtonItem = nil
      }
      if pageCtrl.currentPage != 2 {
        nextButton.isHidden = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style:.plain, target: self, action: #selector(nextPage))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Skip", style:.plain, target: self, action: #selector(skipToIntro))
        
        
      }
   }
  
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
    let pg = Int(targetContentOffset.pointee.x/view.frame.width)
    pageCtrl.currentPage = pg
    if pageCtrl.currentPage == 2 {
      nextButton.isHidden = false
      self.navigationItem.rightBarButtonItem = nil
      self.navigationItem.leftBarButtonItem = nil
    }
    
    if pageCtrl.currentPage != 2 {
      nextButton.isHidden = true
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style:.plain, target: self, action: #selector(nextPage))
      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Skip", style:.plain, target: self, action: #selector(skipToIntro))
    }
    
  }
    
  
}
