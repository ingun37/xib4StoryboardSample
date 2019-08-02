//
//  ViewController.swift
//  xibInStoryboard
//
//  Created by ingun on 03/08/2019.
//  Copyright © 2019 ingun37. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


class MyView: UIView {
    @IBOutlet weak var subView1:UIView!
    @IBOutlet weak var subView2:UIView!
    
    static func loadViewFromNib() -> MyView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing:self), bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! MyView
    }
}

class MyWrapperView1:UIView {
    var contentView:MyView
    
    required init?(coder aDecoder: NSCoder) {
        contentView = MyView.loadViewFromNib()
        super.init(coder: aDecoder)
        contentView.frame = bounds
        addSubview(contentView)
    }
}

//If MyView is dynamically self-resizing view...
class MyWrapperView2:UIView {
    var contentView:MyView
    
    required init?(coder aDecoder: NSCoder) {
        contentView = MyView.loadViewFromNib()
        super.init(coder: aDecoder)
        contentView.frame = bounds
        addSubview(contentView)
        translatesAutoresizingMaskIntoConstraints = false

    contentView.layoutMarginsGuide.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
    contentView.layoutMarginsGuide.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
    contentView.layoutMarginsGuide.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
    contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    }
}
