//
//  ViewController.swift
//  NanoCal
//
//  Created by Nate Armstrong on 6/2/15.
//  Copyright (c) 2015 Nate Armstrong. All rights reserved.
//

import UIKit
import CalendarView
import SwiftMoment

class ViewController: UIViewController {

  @IBOutlet weak var calendar: CalendarView!

  var date: Moment! {
    didSet {
      title = date.format(dateFormat: "MMMM yyyy")
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.blackColor()
    calendar.backgroundColor = UIColor.blackColor()
    date = moment()
    calendar.delegate = self
    calendar.selectDate(moment().substract(1, .Days))
  }

}

extension ViewController: CalendarViewDelegate {

  func calendarDidSelectDate(date: Moment) {
    if date.isCloseTo(moment(), precision: 86400) {
      calendar.selectDate(moment().substract(1, .Days))
    }
  }

  func calendarDidPageToDate(date: Moment) {
    self.date = date
  }

}
