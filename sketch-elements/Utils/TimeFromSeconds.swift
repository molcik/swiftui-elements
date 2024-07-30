//
//  TimeFromSeconds.swift
//  sketch-elements
//
//  Created by Filip Krayem on 25.07.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation

func timeFromSeconds(_ seconds: Int) -> String {
    let minutes = floor(Double(seconds / 60)).truncatingRemainder(dividingBy: 60)
    let seconds = floor(Double((seconds % 3600) % 60))
    
    return "\(addZero(Int(minutes))):\(addZero(Int(seconds)))"
}

private func addZero(_ num: Int) -> String {
  if (num <= 0) {
    return "00";
  }
  if (num < 10) {
    return "0\(num)";
  }
  return "\(num)";
};
