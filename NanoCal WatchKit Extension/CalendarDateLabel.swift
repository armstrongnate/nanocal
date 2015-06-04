//
//  CalendarDateLabel.swift
//  NanoCal
//
//  Created by Nate Armstrong on 6/3/15.
//  Copyright (c) 2015 Nate Armstrong. All rights reserved.
//

import WatchKit
import Foundation
import SwiftMoment
import CalendarView

let otherMonthTextColor = UIColor(white: 1.0, alpha: 0.6)
let todayTextColor = UIColor(red: 4/255.0, green: 222/255.0, blue: 113/255.0, alpha: 1.0)

extension WKInterfaceLabel {

  func setDate(date: Moment, isCurrentMonth: Bool) {
    setText(date.format(dateFormat: "d"))
    setTextColor(date.isToday() ? todayTextColor : .whiteColor())
    if !isCurrentMonth {
      setTextColor(otherMonthTextColor)
    }
  }

}
