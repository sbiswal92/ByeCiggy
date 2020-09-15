//
//  CountModelPicker.swift
//  TrackProgress
//
//  Created by Biswal, Shruti [COM S] on 9/12/20.
//  Copyright © 2020 Biswal, Shruti [COM S]. All rights reserved.
//

import UIKit

class CountModelPicker: UIPickerView {
  var modelData:[String]!
  var chosenData : String!
  var isCurr: Bool!
}

extension CountModelPicker: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    chosenData = modelData[0]
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return modelData.count
  }
  
}

extension CountModelPicker: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if isCurr {
      return (NSLocale(localeIdentifier: "en_IN").currencySymbol)+" "+String(modelData[row])
    } else {
      return String(modelData[row])
    }
  }
  
  /*func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return 100
  }
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 15))
    myLabel.text = modelData[row]
    view.addSubview(myLabel)
    return view
  }*/
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    chosenData = modelData[row]
  }
}
