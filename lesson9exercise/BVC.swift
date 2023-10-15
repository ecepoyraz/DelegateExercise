////
////  BVC.swift
////  lesson9exercise
////
////  Created by Ece Poyraz on 13.10.2023.
////
//
import UIKit
import TinyConstraints
import SnapKit

class BVC: UIViewController {
    
    weak var sendDelegate:DataTransferDelegate?
    
    private lazy var firstTextField:UITextField = {
        let firsttxt = UITextField()
        firsttxt.placeholder = "1. metni girini"
        firsttxt.backgroundColor = .gray
        return firsttxt
        
    }()
    private lazy var secondTextField:UITextField = {
        let secondtxt = UITextField()
        secondtxt.placeholder = "2. metni giriniz."
        secondtxt.backgroundColor = .gray
        return secondtxt
    }()
    private lazy var butonSendInfo:UIButton = {
        let butonSend = UIButton()
        butonSend.setTitle("Send Info Button", for: .normal)
        butonSend.backgroundColor = .green
        butonSend.addTarget(self, action:  #selector(btnShowbtn), for: .touchUpInside)
        butonSend.contentHorizontalAlignment = .left
        butonSend.layer.cornerRadius = 8
        butonSend.tintColor = .purple
        return butonSend
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView2()
    }
   
    @objc func btnShowbtn(){
        let fromTxt = firstTextField.text
        sendDelegate?.getData(data: fromTxt!)
        let deneme = secondTextField.text
        sendDelegate?.getAlertTxt(txt: deneme!)
        self.navigationController?.popViewController(animated: true)
    }
   
    private func setupView2(){
        self.view.backgroundColor = .white
        self.view.addSubview(firstTextField)
        self.view.addSubview(secondTextField)
        self.view.addSubview(butonSendInfo)
    
        Layout2()
    }
    private func Layout2(){
        firstTextField.topToSuperview(offset:60,usingSafeArea: true)
        firstTextField.height(30)
        firstTextField.width(150)
        
        secondTextField.topToSuperview(offset:120,usingSafeArea: true)
        secondTextField.height(30)
        secondTextField.width(150)
        
        butonSendInfo.horizontalToSuperview(insets:.left(50) + .right(50))
        butonSendInfo.height(52)
        butonSendInfo.bottomToSuperview(offset:-24,usingSafeArea: true)
        
    }
    
}
