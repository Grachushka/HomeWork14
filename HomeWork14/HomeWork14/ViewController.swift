//
//  ViewController.swift
//  HomeWork14
//
//  Created by Pavel Procenko on 27/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var htmlCodeTextView: UITextView!
    @IBOutlet weak var waitRequestActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        htmlCodeTextView.text = "Происходит запрос!"
        htmlCodeTextView.textColor = .blue
        NetworkManager.shared.requestToDos { result in
                        switch result {
                        case .success(let text):
                            
                            self.htmlCodeTextView.textColor = .darkText
                            self.htmlCodeTextView.text = text
                            self.waitRequestActivityIndicator.stopAnimating()
                            self.waitRequestActivityIndicator.isHidden = true
                            
                        case .failure(let error):
                            
                             self.htmlCodeTextView.textColor = .red
                             self.htmlCodeTextView.text = "\(error)"
                             self.waitRequestActivityIndicator.stopAnimating()
                             self.waitRequestActivityIndicator.isHidden = true


                        }
                    }
                    print(1)
    }


}

