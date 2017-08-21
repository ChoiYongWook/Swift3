//: Playground - noun: a place where people can play

import UIKit

let styles = [NumberFormatter.Style.decimal,
              NumberFormatter.Style.currency,
              NumberFormatter.Style.percent,
              NumberFormatter.Style.scientific,
              NumberFormatter.Style.spellOut,
              NumberFormatter.Style.ordinal,
              NumberFormatter.Style.currencyISOCode,
              NumberFormatter.Style.currencyPlural,
              NumberFormatter.Style.currencyAccounting]

let num = NSNumber(value: 12345)
let formatter = NumberFormatter()

//한국 표현식
formatter.locale = Locale(identifier: "Ko-kr")

for style in styles {
    formatter.numberStyle = style
    
    //정식은 NSNumber로 넘겨야 함 : Objective - C 와 공유가 가능함
    //Swift3 에서는 num 대신에 아무거나 넘겨도 상관 없음 (숫자 그냥 전달)
    if let result = formatter.string(from: num) {
        print(result)
    }
}
