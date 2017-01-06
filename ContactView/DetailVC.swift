//
//  DetailVC.swift
//  ContactView
//
//  Created by NguyenDucBien on 1/6/17.
//  Copyright © 2017 NguyenDucBien. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var person = Person()
    var lblName = UILabel()
    var lblphoneNumber = UILabel()
    var btnCall = UIButton()
    var btnMes = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        lblName.frame = CGRectMake(0, 0, self.view.bounds.width, 25)
        lblName.textAlignment = .Center
        lblName.center = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        lblName.font = UIFont.boldSystemFontOfSize(25)
        lblName.text = person.fullName
        self.view.addSubview(self.lblName)
        
        lblphoneNumber.frame = CGRectMake(0,0, self.view.bounds.width, 50)
        lblphoneNumber.center = CGPoint(x: self.view.bounds.size.width/2, y: lblName.center.y + 25)
        lblphoneNumber.font = UIFont.boldSystemFontOfSize(15)
        lblphoneNumber.textAlignment = .Center
        lblphoneNumber.text = "Mobile : \(person.mobilePhone)"
        self.view.addSubview(self.lblphoneNumber)
        
        
        
        btnMes.setImage(UIImage(named: "message.png"), forState: .Normal)
        btnMes.frame = CGRectMake(0, 0, 50, 50)
        btnMes.center = CGPoint(x: self.view.bounds.size.width/2 + 30, y: lblphoneNumber.center.y + 40)
        self.view.addSubview(self.btnMes)
        
        
        btnCall.setImage(UIImage(named: "Call.png"), forState: .Normal)
        btnCall.frame = CGRectMake(0, 0, 50, 50)
        btnCall.center = CGPoint(x: btnMes.center.x - (btnMes.frame.width + 10), y: lblphoneNumber.center.y + 40)
        self.view.addSubview(self.btnCall)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }



}
