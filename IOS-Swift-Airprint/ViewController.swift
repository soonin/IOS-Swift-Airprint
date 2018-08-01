//
//  ViewController.swift
//  IOS-Swift-Airprint
//
//  Created by Pooya on 2018-07-31.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func printText(_ sender: Any) {
        // 1  The UIPrintInteractionController presents the user interface and manages the printing.
        let printController = UIPrintInteractionController.shared
        // 2  The UIPrintinfo object contains information about the print job, This information is assigned to the printInfo property of the UIPrintInteractionController.
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.general
        printInfo.jobName = "print Job"
        printController.printInfo = printInfo
        
        // 3 The printing text can be formatted. here we define the insets for the printing page
        let formatter = UIMarkupTextPrintFormatter(markupText: textView.text)
        formatter.perPageContentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        printController.printFormatter = formatter
        
        // 4 The user is presented the iPhone printing interface to select a printer and the number of copies
        printController.present(animated: true, completionHandler: nil)
    }
    
}

