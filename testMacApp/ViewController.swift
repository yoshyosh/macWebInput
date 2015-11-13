//
//  ViewController.swift
//  testMacApp
//
//  Created by Joseph Anderson on 11/11/15.
//  Copyright © 2015 janderson. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet var webView: WebView!
    var mainFrame: WebFrame!
    @IBOutlet var searchField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let startUrl = NSURL(string: "http://stackoverflow.com")
        let request = NSURLRequest(URL: startUrl!)
        // Do any additional setup after loading the view.
        mainFrame = webView.mainFrame
        mainFrame.loadRequest(request)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
      
    @IBAction func didClickButton(sender: AnyObject) {
        let form = mainFrame.DOMDocument.getElementById("search")
        let searchNode = form.firstElementChild
        let domForm = form as! DOMHTMLFormElement
        let searchValue = searchField.stringValue
        searchNode.setAttribute("value", value: searchValue)
        domForm.submit()
        print(searchValue)
    }

}

