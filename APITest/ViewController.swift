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
  
    @IBOutlet var userId: UITextField!
    
    @IBOutlet var name: UITextField!
    
    @IBOutlet var responseView: UITextView!
    
    @IBAction func post(_ sender: Any) {
        // 1. 전송할 값 준비
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        let param = "userId=\(userId)&name=\(name)" // key1=value1&key2=value2&...
        let paramData = param.data(using: .utf8)
        
        // 2. URL 객체 정의
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
        
        // 3. URLRequest 객체를 정의하고, 요청 내용을 담는다.
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        // 4. HTTPA 메시지 헤더 설정
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 생성
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 5-1 서버가 응답이 없거나 통신이 실패했을 때
            if let e = error {
                NSLog("An error has occured : \(e.localizedDescription)")
                return
            }
            // 5-2 응답 처리 로직
        }
        // 6. POST 전송
        task.resume()
    }
    
    
    
}

