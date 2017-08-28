//
//  ViewController.swift
//  TextFieldSample_1
//
//  Created by YongWook Choi on 2017. 8. 28..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var limitedField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var overlayViewField: UITextField!
    
    //키보드의 return 키를 눌렀을때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == limitedField {
            emailField.becomeFirstResponder()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == numberField {
            //        guard let _ = Int(string) else {
            //            return false
            //        }
            
            //숫자의 CharacterSet을 만든 후 그 set을 뒤집어서 set변수에 저장
            let set = CharacterSet(charactersIn: "0123456789.-").inverted
            
            //입력받은 문자에 CharacterSet의 문자가 검색되면 문자가 입력 되었다는 뜻이라서 false리턴
            if let _ = string.rangeOfCharacter(from: set) {
                return false
            }
        } else if textField == limitedField {
            //7자 제한
            if string.characters.count > 0 {
                let finalText = (textField.text ?? "") + string
                if finalText.characters.count > 7 {
                    return false
                }
            }
        }else if textField == emailField {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.red.cgColor
            //정상적인 Email형식이면 초록색으로 바꾸기
        }
        
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let frame = CGRect(x: 0, y: 0, width: 20, height: 20)
//        let imgView = UIImageView(frame: frame)
//        let img = UIImage(named: "icon")
//        imgView.image = img
        
        let dummyView = UIView(frame: frame)

        overlayViewField.leftView = dummyView//UIView
        overlayViewField.leftViewMode = .always
        
        overlayViewField.rightView = dummyView
        overlayViewField.rightViewMode = .always
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

