//
//  MainViewController.swift
//  CollectionViewDeletedCell
//
//  Created by Vũ on 2/26/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageViewController: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    var images = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewController.image = images
        scrollView.delegate = self

        // Do any additional setup after loading the view.
    }

    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageViewController
    }

}
