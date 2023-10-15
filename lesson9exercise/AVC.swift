//
//  BVC.swift
//  lesson9exercise
//
//  Created by Ece Poyraz on 13.10.2023.
//

import UIKit
import TinyConstraints
import SnapKit

protocol DataTransferDelegate:AnyObject {
    func getData(data:String)
    func getAlertTxt(txt:String)
}

extension AVC{
    func getData(data: String) {
        transferredData = data
    }
    
func getAlertTxt(txt: String){
        alertTxt = txt
    }
}

class AVC: UIViewController, DataTransferDelegate {
    
    var transferredData:String?
    var alertTxt:String?
    
    private lazy var firstLabel:UILabel = {
        let first = UILabel()
        first.text = "delegetaten gelecek text"
        first.backgroundColor = .yellow
        return first
        
    }()
    private lazy var btnShow:UIButton = {
        let btnShow = UIButton()
        btnShow.setTitle("push button", for: .normal)
        btnShow.setTitleColor(.black, for: .normal)
        btnShow.backgroundColor = .gray
        btnShow.addTarget(self, action: #selector(btnPushbtn), for: .touchUpInside)
        btnShow.contentHorizontalAlignment = .left
        btnShow.layer.cornerRadius = 8
        btnShow.tintColor = .white
        return btnShow
    }()
    
    private lazy var btnNav:UIButton = {
        let btnNav = UIButton()
        btnNav.setTitle("show button", for: .normal)
        btnNav.setTitleColor(.black, for: .normal)
        btnNav.backgroundColor = .systemBlue
        btnNav.addTarget(self, action: #selector(btnShowbtn), for: .touchUpInside)
        btnNav.contentHorizontalAlignment = .left
        btnNav.layer.cornerRadius = 8
        btnNav.tintColor = .white
        return btnNav
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @objc func btnPushbtn(){
        let vc = BVC()
        vc.sendDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(alert, animated: true)
    }
    
    @objc func btnShowbtn(){
        firstLabel.text = transferredData
        let alert = UIAlertController(title: "uyarı", message: alertTxt, preferredStyle: .alert)
        self.present(alert, animated: true)
       // sendDelegate?.getAlert(title: "uyarı", message: alertMessage)

    }
    
    private func setupView(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(firstLabel)
        self.view.addSubview(btnShow)
        self.view.addSubview(btnNav)
        Layout()
    }
    
    private func Layout(){
        
        firstLabel.topToSuperview(offset:60,usingSafeArea: true)
        firstLabel.height(52)
        firstLabel.leftToSuperview(offset:60,usingSafeArea: true)
        firstLabel.width(300)
        
        btnNav.horizontalToSuperview(insets:.left(50) + .right(50))
        btnNav.height(52)
        btnNav.bottomToSuperview(offset:-24,usingSafeArea: true)
        
        btnShow.horizontalToSuperview(insets:.left(50) + .right(50))
        btnShow.height(52)
        btnShow.bottomToTop(of: btnNav, offset:-20)
    }}

