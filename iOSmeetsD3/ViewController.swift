//
//  ViewController.swift
//  iOSmeetsD3
//
//  Created by mnkn on 18.04.17.
//  Copyright © 2017 Minikin.me. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
  
  var webView: WKWebView!
  @IBOutlet weak var toolBar: UIToolbar!

  override func loadView() {
    let webConfiguration = WKWebViewConfiguration()
    webView = WKWebView(frame: .zero, configuration: webConfiguration)
    webView.uiDelegate = self
    view = webView
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    customButton()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(false)
    
    setupWebView()
  }

  func setupWebView(){
    
    guard let resourceUrl = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "web"),
          let webAppPath = Bundle.main.resourcePath?.appending("/web") else { return }
    
    let webAppUrl = URL(fileURLWithPath: webAppPath, isDirectory: true)
    
    do {
      let contents = try String(contentsOf: resourceUrl, encoding: .utf8)
      webView.loadHTMLString(contents, baseURL: webAppUrl)
    } catch  {
      print(error.localizedDescription)
    }
  }
  
  // Create button programaticaly 
  
  func customButton(){
    
    let btn = UIButton(frame: CGRect(x: 0, y: 500, width: 100, height: 50))
    
    btn.backgroundColor = .green
    btn.setTitle("Click Me", for: .normal)
    btn.addTarget(self, action: #selector(refreshData), for: .touchUpInside)
    view.addSubview(btn)
  }
  
  func refreshData(sender: UIButton!) {
    webView.evaluateJavaScript("updateGraph()", completionHandler: nil)
  }

  
}


extension ViewController: WKUIDelegate {}
