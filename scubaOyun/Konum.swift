//
//  Konum.swift
//  temizAnim
//
//  Created by MURAT HASIRCI on 22.03.2021.
//

import Foundation
import UIKit

class Konumlar {
    
    func baslaKonum(view: UIView, baslaBtn: UIButton){
        view.addSubview(baslaBtn)
        baslaBtn.anchor(top: view.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: UIScreen.main.bounds.size.height/2, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        
    }
    func konuKonumBir(view: UIView, konu1Btn : UIButton){
        view.addSubview(konu1Btn)
        konu1Btn.anchor(top: view.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: UIScreen.main.bounds.size.height/2, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        
    }
    
    func konuKonum(view: UIView,  konuABtn : UIButton, konuBBtn : UIButton, konuCBtn : UIButton, konuDBtn : UIButton, konuEBtn : UIButton, konuFBtn : UIButton){
        
        
        view.addSubview(konuABtn)
        view.addSubview(konuBBtn)
        view.addSubview(konuCBtn)
        view.addSubview(konuDBtn)
        view.addSubview(konuEBtn)
        view.addSubview(konuFBtn)
        
        //konu1Btn.anchor(top: view.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 200, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        
        konuABtn.anchor(top: konu1Btn.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: konuBBtn.leadingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: (UIScreen.main.bounds.width - 60)/2, height: 50)
        konuBBtn.anchor(top: konu1Btn.bottomAnchor, bottom: nil, leading: konuABtn.trailingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: (UIScreen.main.bounds.width - 60)/2, height: 50)
        
        konuCBtn.anchor(top: konuABtn.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: konuBBtn.leadingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: (UIScreen.main.bounds.width - 60)/2, height: 50)
        konuDBtn.anchor(top: konuABtn.bottomAnchor, bottom: nil, leading: konuCBtn.trailingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: (UIScreen.main.bounds.width - 60)/2, height: 50)
        
        konuEBtn.anchor(top: konuCBtn.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: konuBBtn.leadingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: (UIScreen.main.bounds.width - 60)/2, height: 50)
        konuFBtn.anchor(top: konuCBtn.bottomAnchor, bottom: nil, leading: konuEBtn.trailingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: (UIScreen.main.bounds.width - 60)/2, height: 50)
        
        
    }
    
    
    func kategoriKonum(view: UIView, birYildizBtn: UIButton, ikiYildizBtn: UIButton, ucYildizBtn: UIButton){
        view.addSubview(birYildizBtn)
        birYildizBtn.anchor(top: view.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 300, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        
        view.addSubview(ikiYildizBtn)
        ikiYildizBtn.anchor(top: birYildizBtn.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 20, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        
        view.addSubview(ucYildizBtn)
        ucYildizBtn.anchor(top: ikiYildizBtn.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        
    }
    
    
    
    
}

extension UIView {
    
    func anchor(top : NSLayoutYAxisAnchor?,
                bottom : NSLayoutYAxisAnchor?,
                leading : NSLayoutXAxisAnchor?,
                trailing : NSLayoutXAxisAnchor?,
                centerx : NSLayoutXAxisAnchor?,
                paddingTop : CGFloat,
                paddingBottom : CGFloat,
                paddingLeft : CGFloat,
                paddingRight : CGFloat,
                width : CGFloat,
                height : CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: paddingRight).isActive = true
        }
        if let centerx = centerx {
            self.centerXAnchor.constraint(equalTo: centerx).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
}

