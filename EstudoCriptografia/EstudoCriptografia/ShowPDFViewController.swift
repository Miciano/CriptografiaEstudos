//
//  ShowPDFViewController.swift
//  EstudoCriptografia
//
//  Created by Fabio Miciano on 20/07/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class ShowPDFViewController: UIViewController {
    
    let name: String
    let fileManager = FileManagerActions()
    
    var webView: UIWebView {
        return self.view as! UIWebView
    }
    
    init(with name: String) {
        self.name = name
        super.init(nibName: "ShowView", bundle: Bundle.main)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Carregando o path do arquivo em formato URLRequest
        guard let pathDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return }
        let url = URL(fileURLWithPath: "\(pathDirectory)/\(name)")
        let request = URLRequest(url: url)
        //Fazendo load do PDF em uma webView
        webView.loadRequest(request)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
