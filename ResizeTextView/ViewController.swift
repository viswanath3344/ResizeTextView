//
//  ViewController.swift
//  ResizeTextView
//
//  Created by Ming-En Liu on 22/06/18.
//  Copyright © 2018 Vedas labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func createTextView() {
        // Do any additional setup after loading the view, typically from a nib.
        
        // Creating TextView
        let textView = UITextView()
        textView.backgroundColor = UIColor.brown
        textView.font  = UIFont.preferredFont(forTextStyle: .headline)
        textView.textColor = UIColor.white
        textView.text = "This is Sample application for TextView height increase based on text chnages."
        textView.delegate = self
         self.view.addSubview(textView)
        // Enabling
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 100)
            
            ].forEach { (constarint) in
                constarint.isActive = true
        }
       
        textView.isScrollEnabled  = false
        textViewDidChange(textView)
    }
    

}
extension ViewController:UITextViewDelegate
{
    func textViewDidChange(_ textView: UITextView) {
     
        print(textView.text)
        
        let size  = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height
            {
                constraint.constant = estimatedSize.height
            }
        }
        
    }
    
}

