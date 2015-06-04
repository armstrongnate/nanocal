//
//  InterfaceController.swift
//  NanoCal WatchKit Extension
//
//  Created by Nate Armstrong on 6/3/15.
//  Copyright (c) 2015 Nate Armstrong. All rights reserved.
//

import WatchKit
import Foundation
import SwiftMoment
import CalendarView

class InterfaceController: WKInterfaceController {

  @IBOutlet weak var day0: WKInterfaceLabel!
  @IBOutlet weak var day1: WKInterfaceLabel!
  @IBOutlet weak var day2: WKInterfaceLabel!
  @IBOutlet weak var day3: WKInterfaceLabel!
  @IBOutlet weak var day4: WKInterfaceLabel!
  @IBOutlet weak var day5: WKInterfaceLabel!
  @IBOutlet weak var day6: WKInterfaceLabel!
  @IBOutlet weak var day7: WKInterfaceLabel!
  @IBOutlet weak var day8: WKInterfaceLabel!
  @IBOutlet weak var day9: WKInterfaceLabel!
  @IBOutlet weak var day10: WKInterfaceLabel!
  @IBOutlet weak var day11: WKInterfaceLabel!
  @IBOutlet weak var day12: WKInterfaceLabel!
  @IBOutlet weak var day13: WKInterfaceLabel!
  @IBOutlet weak var day14: WKInterfaceLabel!
  @IBOutlet weak var day15: WKInterfaceLabel!
  @IBOutlet weak var day16: WKInterfaceLabel!
  @IBOutlet weak var day17: WKInterfaceLabel!
  @IBOutlet weak var day18: WKInterfaceLabel!
  @IBOutlet weak var day19: WKInterfaceLabel!
  @IBOutlet weak var day20: WKInterfaceLabel!
  @IBOutlet weak var day21: WKInterfaceLabel!
  @IBOutlet weak var day22: WKInterfaceLabel!
  @IBOutlet weak var day23: WKInterfaceLabel!
  @IBOutlet weak var day24: WKInterfaceLabel!
  @IBOutlet weak var day25: WKInterfaceLabel!
  @IBOutlet weak var day26: WKInterfaceLabel!
  @IBOutlet weak var day27: WKInterfaceLabel!
  @IBOutlet weak var day28: WKInterfaceLabel!
  @IBOutlet weak var day29: WKInterfaceLabel!
  @IBOutlet weak var day30: WKInterfaceLabel!
  @IBOutlet weak var day31: WKInterfaceLabel!
  @IBOutlet weak var day32: WKInterfaceLabel!
  @IBOutlet weak var day33: WKInterfaceLabel!
  @IBOutlet weak var day34: WKInterfaceLabel!
  @IBOutlet weak var day35: WKInterfaceLabel!
  @IBOutlet weak var day36: WKInterfaceLabel!
  @IBOutlet weak var day37: WKInterfaceLabel!
  @IBOutlet weak var day38: WKInterfaceLabel!
  @IBOutlet weak var day39: WKInterfaceLabel!
  @IBOutlet weak var day40: WKInterfaceLabel!
  @IBOutlet weak var day41: WKInterfaceLabel!

  @IBOutlet weak var nextButton: WKInterfaceButton!
  @IBOutlet weak var previousButton: WKInterfaceButton!

  lazy var dayLabels: [WKInterfaceLabel] = {
    [
      self.day0, self.day1, self.day2, self.day3, self.day4, self.day5, self.day6,
      self.day7, self.day8, self.day9, self.day10, self.day11, self.day12, self.day13,
      self.day14, self.day15, self.day16, self.day17, self.day18, self.day19, self.day20,
      self.day21, self.day22, self.day23, self.day24, self.day25, self.day26, self.day27,
      self.day28, self.day29, self.day30, self.day31, self.day32, self.day33, self.day34,
      self.day35, self.day36, self.day37, self.day38, self.day39, self.day40, self.day41,
    ]
  }()

  var firstDayOfMonth: Moment! {
    didSet {
      updateLabels()
      setTitle(firstDayOfMonth.format(dateFormat: "MMMM yyyy"))
      nextButton.setTitle(firstDayOfMonth.add(1, .Months).format(dateFormat: "MMM"))
      previousButton.setTitle(firstDayOfMonth.substract(1, .Months).format(dateFormat: "MMM"))
    }
  }

  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    // Configure interface objects here.
    firstDayOfMonth = moment().startOf(.Months)
  }

  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }

  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }

  @IBAction func next() {
    firstDayOfMonth = firstDayOfMonth.add(1, .Months).startOf(.Months)
  }

  @IBAction func previous() {
    firstDayOfMonth = firstDayOfMonth.substract(1, .Months).startOf(.Months)
  }

  func updateLabels() {
    var currentDay = firstDayOfMonth.substract(firstDayOfMonth.weekday - 1, .Days)
    for label in dayLabels {
      label.setText(currentDay.format(dateFormat: "d"))
      label.setTextColor(.whiteColor())
      if currentDay.isToday() {
        label.setTextColor(UIColor(red: 4/255.0, green: 222/255.0, blue: 113/255.0, alpha: 1.0))
      }
      else if !currentDay.isSameMonth(firstDayOfMonth) {
        label.setTextColor(UIColor(white: 1.0, alpha: 0.6))
      }
      currentDay = currentDay.add(1, .Days)
    }
  }

}
