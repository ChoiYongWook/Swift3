//
//  ViewController.swift
//  Browser
//
//  Created by YongWook Choi on 2017. 9. 11..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var prevButton: UIBarButtonItem!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        let context = appDelegate.persistentContainer.viewContext
        
        guard let title = webView.stringByEvaluatingJavaScript(from: "document.title") else {    return  }
        
        let newFavorite = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: context) as! Favorite
        
        newFavorite.title = title
        newFavorite.url = webView.request?.url?.absoluteString
        newFavorite.date = Date() as NSDate
        
        do {
            try context.save()
            print("saved")
        } catch {
            print(error)
        }
    }
    
    func updateButtonState(){
        prevButton.isEnabled = webView.canGoBack
        nextButton.isEnabled = webView.canGoForward
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        updateButtonState()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        updateButtonState()
        
        let context = appDelegate.persistentContainer.viewContext
        
        guard let title = webView.stringByEvaluatingJavaScript(from: "document.title") else {    return  }
        
        let newHistory = NSEntityDescription.insertNewObject(forEntityName: "History", into: context) as! History
        
        newHistory.title = title
        newHistory.url = webView.request?.url?.absoluteString
        newHistory.date = Date() as NSDate
        
        do {
            try context.save()
            print("saved")
        } catch {
            print(error)
        }
    }
    
    @IBAction func goPrev(_ sender: Any) {
        if webView.canGoBack{
            webView.goBack()
        }
        updateButtonState()
    }
    
    @IBAction func goNext(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
        
        updateButtonState()
    }
    
    @IBAction func performRefresh(_ sender: Any) {
        webView.reload()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard var str = textField.text?.lowercased() else {   return true  }
        
        if !str.contains("http://") {
            str =  "http://\(str)"
        }
        
        guard let url = URL(string: str) else {   return true  }
        
        let request = URLRequest(url: url)
        
        webView.loadRequest(request)
        
        return true
    }
    
    func handle(noti: Notification){
        if let urlStr = noti.object as? String{
            guard let url = URL(string: urlStr) else {   return  }
            
            let request = URLRequest(url: url)
            
            webView.loadRequest(request)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prevButton.isEnabled = false
        nextButton.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(handle(noti:)), name: UrlDidSelectNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

