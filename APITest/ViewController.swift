//
//  ViewController.swift
//  APITest
//
//  Created by 정기욱 on 04/03/2019.
//  Copyright © 2019 Kiwook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet var currentTime: UILabel!
    
    @IBAction func callCurrentTime(_ sender: Any) {
        
        // 1. URL 설정 및 GET 방식으로 API 호출
        do {
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
            
            let response = try String(contentsOf: url!)
            
            // 2. 읽어온 값을 레이블에 표시
            self.currentTime.text = response
            self.currentTime.sizeToFit()
        } catch let e as NSError {
            print(e.localizedDescription)
        }
    }
    
    
    
}

