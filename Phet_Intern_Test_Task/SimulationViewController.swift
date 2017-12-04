//
//  SimulationViewController.swift
//  Phet_Intern_Test_Task
//
//  Created by Tristan Neate on 12/3/17.
//  Copyright © 2017 Tristan Neate. All rights reserved.
//

import UIKit
import WebKit

class SimulationViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!//web wrapper
    let progressView = UIProgressView(progressViewStyle: .default)//provide loading bar for webpage
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load the provide simulation
        let url = URL(string: "https://phet.colorado.edu/sims/html/circuit-construction-kit-dc/latest/circuit-construction-kit-dc_en.html")!
        let req = URLRequest(url: url)
        webView!.load(req)
        
        //attach the loading bar to webview
        progressView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 10)
        self.webView!.addSubview(progressView)
        
        
        //listen for loading changes
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    //update loading bar
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
            if(progressView.progress == 1){//hide once done
                progressView.removeFromSuperview()
            }
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
