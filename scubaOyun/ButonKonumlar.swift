//
//  ButonKonumlar.swift
//  temizAnim
//
//  Created by MURAT HASIRCI on 22.03.2021.
//

import Foundation
import UIKit


class Animasyon{
    
    
    
    func konumAnim(gelenImg : UIImageView, X : Int, Y : Int, W : Int, H : Int, gorunurluk : CGFloat){
        gelenImg.alpha = gorunurluk
        gelenImg.frame = CGRect(x: X, y: Y, width: W, height: H)
    }
    
    func animasyonBasla(buyuyenView : UIView, view : UIView){
        
        buyuyenView.frame = CGRect(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2, width: 10, height: 10)
       
        let screenCenter = CGPoint(x:UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
                let subviewCenter = view.convert(buyuyenView.center, to: view)
                let offset = UIOffset(horizontal: screenCenter.x-subviewCenter.x, vertical: screenCenter.y-subviewCenter.y)

                let widthScale = UIScreen.main.bounds.size.width
                let heightScale = UIScreen.main.bounds.size.height/buyuyenView.frame.size.height
        
                UIView.animate(withDuration: 1.0, animations: {
                    let scaleTransform = CGAffineTransform(scaleX: widthScale, y: heightScale)
                    let translateTransform = CGAffineTransform(translationX: offset.horizontal, y: offset.vertical)
                    buyuyenView.transform = scaleTransform.concatenating(translateTransform)
                }, completion: { (finished) in
                    //sender.tag = 1;
                })
       
        
        
        
    }
    //********
    func gecisAnimasyon(buyuyenView : UIView, view : UIView, logoImg : UIImageView, secim : Int, scubaImg :UIImageView){
        
        
        buyuyenView.frame = CGRect(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2, width: 10, height: 10)
        
        logoImg.frame = CGRect(x: -500, y: UIScreen.main.bounds.size.height/2 - 77, width: 200, height: 155)
        logoImg.alpha = 1
        
        scubaImg.frame = CGRect(x: 500, y: 150, width: 200, height: 60)
        scubaImg.alpha = 1
        
                UIView.animate(withDuration: 1.0, animations: {
               
                    buyuyenView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
                    logoImg.frame = CGRect(x: UIScreen.main.bounds.size.width/2 - 100, y: UIScreen.main.bounds.size.height/2 - 77, width: 200, height: 155)
                    scubaImg.frame = CGRect(x: UIScreen.main.bounds.size.width/2 - 100, y: 150, width: 200, height: 60)
                       

                }, completion: { (finished) in
                    UIView.animate(withDuration: 1, delay: 0.2) {
                        scubaImg.frame = CGRect(x: 500, y: 150, width: 200, height: 60)
                    }
                   UIView.animate(withDuration: 2, delay: 0.2) {
                    logoImg.alpha = 0

                    buyuyenView.frame = CGRect(x: -500, y: 0, width: view.frame.width, height: view.frame.height)
                    
                
                   }
                })
       
        
        if secim == 0{kategoriAnimas()}
        if secim == 1{konuAnimas()}
        if secim == 2{konuAnimas()}
        if secim == 3{konuAnimas()}
        
        }
        
    
    func kategoriAnimas(){
        
        birYildizBtn.alpha = 0
        ikiYildizBtn.alpha = 0
        ucYildizBtn.alpha = 0
        UIView.animate(withDuration: 1, delay: 1) {
        
            birYildizBtn.alpha = 1
            ikiYildizBtn.alpha = 1
            ucYildizBtn.alpha = 1
    
        }
    }
    func konuAnimas(){
        
        konu1Btn.alpha = 0
        konu21Btn.alpha = 0
        konu22Btn.alpha = 0
        konu23Btn.alpha = 0
        konu24Btn.alpha = 0
        konu25Btn.alpha = 0
        konu26Btn.alpha = 0
        konu31Btn.alpha = 0
        konu32Btn.alpha = 0
        konu33Btn.alpha = 0
        konu34Btn.alpha = 0
        konu35Btn.alpha = 0
        konu36Btn.alpha = 0
        UIView.animate(withDuration: 1, delay: 1) {
            konu1Btn.alpha = 1
            konu21Btn.alpha = 1
            konu22Btn.alpha = 1
            konu23Btn.alpha = 1
            konu24Btn.alpha = 1
            konu25Btn.alpha = 1
            konu26Btn.alpha = 1
            konu31Btn.alpha = 1
            konu32Btn.alpha = 1
            konu33Btn.alpha = 1
            konu34Btn.alpha = 1
            konu35Btn.alpha = 1
            konu36Btn.alpha = 1
        }
        
    }
    
    //*******
    func butonHareket(sonucImg : UIImageView, sonucTextImg : UIImageView, logoImg : UIImageView, muratImg : UIImageView, hasirciImg : UIImageView, buyuyenView : UIView, color : UIColor, tamamBtn : UIButton, puanGosterLbl : UILabel){
       
        buyuyenView.backgroundColor = color
        
        UIView.animate(withDuration: 1, delay: 1.0) {
            sonucImg.alpha = 1
            sonucTextImg.alpha = 1
            tamamBtn.alpha = 1
            puanGosterLbl.alpha = 1
        }
        UIView.animate(withDuration: 3, delay: 1.0) {
            logoImg.alpha = 0.7
        }
            
        UIView.animate(withDuration: 2, delay: 1.0, options: .curveEaseIn, animations: {
            
            muratImg.frame = CGRect(x:  UIScreen.main.bounds.width/2 - 70, y: 255, width: 100, height: 25)
            
            }, completion: nil)
       
        UIView.animate(withDuration: 3, delay: 1.0, options: .curveEaseInOut, animations: {
            
            hasirciImg.frame = CGRect(x:  UIScreen.main.bounds.width/2 - 30, y: 280, width: 100, height: 25)
            
            }, completion: nil)
    }
    ///
    
    func geriAnimasyonsonucImg(hayirImg : UIImageView, evetImg : UIImageView, logoImg : UIImageView, muratImg : UIImageView, hasirciImg : UIImageView, buyuyenView : UIView, tamamBtn : UIButton, mukemmelImg : UIImageView, oyunBitti : UIImageView, sureBittiImg : UIImageView){
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            
            hasirciImg.frame = CGRect(x:  500, y: 280, width: 100, height: 25)
            muratImg.frame = CGRect(x:  -500, y: 255, width: 100, height: 25)
            tamamBtn.alpha = 0
            logoImg.alpha = 0
            buyuyenView.alpha = 0
            hayirImg.alpha = 0
            evetImg.alpha = 0
            mukemmelImg.alpha = 0
            oyunBitti.alpha = 0
            sureBittiImg.alpha = 0
            
            }, completion: nil)
        
    }
    
    
}
