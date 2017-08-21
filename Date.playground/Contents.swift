//: Playground - noun: a place where people can play

import UIKit

//기념일 계산기 만들기

let calendar = Calendar.current
var components = DateComponents()
components.year = 2014
components.month = 4
components.day = 16

let date = calendar.date(from: components)

let now = Date()
let formatter = DateFormatter()
formatter.dateStyle = DateFormatter.Style.full

formatter.timeStyle = .medium
formatter.dateFormat = "yyyy. MM. dd"
let dateTimeStr = formatter.string(from: now)

let dateStr = "2017. 08. 03"
formatter.dateFormat = "yyyy. MM. dd"
let stringToDate = formatter.date(from: dateStr)