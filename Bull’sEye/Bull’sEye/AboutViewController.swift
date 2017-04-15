//
//  AboutViewController.swift
//  Bull’sEye
//
//  Created by Maged Kasem on 4/12/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import UIKit
class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
            if let htmlData = try? Data(contentsOf : url){
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                
                webView.load(htmlData,mimeType: "text/html", textEncodingName: "UTF-8",baseURL: baseURL)
            }
            
        }
        
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
