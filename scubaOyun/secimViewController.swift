//
//  secimViewController.swift
//  scubaOyun
//
//  Created by MURAT HASIRCI on 10.03.2021.
//

import UIKit

class secimViewController: UIViewController, MyDataSendingDelegate {
   

    
    @IBOutlet weak var birYildizBtn: UIButton!
    @IBOutlet weak var geceBtn: UIButton!
    @IBOutlet weak var hastaliklarBtn: UIButton!
    @IBOutlet weak var havaBtn: UIButton!
    @IBOutlet weak var ilkyardimBtn: UIButton!
    @IBOutlet weak var nitrojenBtn: UIButton!
    @IBOutlet weak var planlamaBtn: UIButton!
    @IBOutlet weak var scorLbl: UILabel!
    @IBOutlet weak var enYuksekScor: UILabel!
    
    
    
    var tabloGiris = "birYildiz"
    var soruSayi = 1
    var soruBank = 1
    var kacSoruOlsun = 3
    //var sifirla = Bool ()
    var sik = 0
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "sakliScor"){
            enYuksekScor.text = "\(x)"
        }
        
       
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
       /*
        if sifirla == false{
            sik = Int(scorLbl.text!)!
        }
        
       */
        
    }
    
    

    @IBAction func soruTabloSec(_ sender: UIButton) {
        
        if sender.tag == 1{konuSec(tablo: "birYildiz", soru: kacSoruOlsun, bank: 56)}
        if sender.tag == 2{konuSec(tablo: "gece", soru: kacSoruOlsun, bank: 19)}
        if sender.tag == 3{konuSec(tablo: "hastaliklar", soru: kacSoruOlsun, bank: 51)}
        if sender.tag == 4{konuSec(tablo: "hava", soru: kacSoruOlsun, bank: 17)}
        if sender.tag == 5{konuSec(tablo: "ilkyardim", soru: kacSoruOlsun, bank: 17)}
        if sender.tag == 6{konuSec(tablo: "nitrojen", soru: kacSoruOlsun, bank: 26)}
        if sender.tag == 7{konuSec(tablo: "planlama", soru: kacSoruOlsun, bank: 14)}
        
        performSegue(withIdentifier: "gitSorular", sender: self)
    }
    
    func konuSec(tablo : String, soru : Int, bank : Int){
        
        tabloGiris = tablo
        soruSayi = soru
        soruBank = bank
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
             
        
        
        
             if segue.destination is ViewController{
                let vc = segue.destination as? ViewController
                vc?.tabloGir = tabloGiris
                vc?.SoruBankasi = soruBank
                vc?.soruSayisi = soruSayi
                vc?.puan = sik
                
                vc?.delegate = self
             }
    }
    
    
    
    func sendDataToFirstViewController(puanim: String) {
      
            scorLbl.text = puanim
      
        //enYuksekScor = puanim
    }
    
    
}
