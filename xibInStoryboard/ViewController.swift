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
        let nib = UINib(nibName: "MyViews", bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first {
            ($0 as? UIView)?.restorationIdentifier == "1"
        }! as! MyView
    }
}


class MyView2: UIView {
    @IBOutlet weak var lbl:UILabel!
    
    static func loadViewFromNib() -> MyView2 {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "MyViews", bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first {
            ($0 as? UIView)?.restorationIdentifier == "2"
        }! as! MyView2
    }
}

class StoryMyView1:UIView {
    var contentView:MyView
    required init?(coder aDecoder: NSCoder) {
        contentView = MyView.loadViewFromNib()
        super.init(coder: aDecoder)
        contentView.frame = bounds
        addSubview(contentView)
    }
}

class StoryMyView2:UIView {
    var contentView:MyView2
    required init?(coder aDecoder: NSCoder) {
        contentView = MyView2.loadViewFromNib()
        super.init(coder: aDecoder)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
