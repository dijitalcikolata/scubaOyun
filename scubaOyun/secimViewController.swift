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
    var kacSoruOlsun = 1
    var sifirla = true
    
    
    var puan = Int()
    //var sik = 0
    
    let rastgele = rastgeleSayi()
    
    
    
    override func viewDidAppear(_ animated: Bool) {
      
        enYuksek()
        
        if birYildizBtn.isHidden == true && geceBtn.isHidden == true && hastaliklarBtn.isHidden == true && havaBtn.isHidden == true && ilkyardimBtn.isHidden == true && nitrojenBtn.isHidden == true && planlamaBtn.isHidden == true {
            
            sifirla = true
            butonGorunur()
            alertOlayi(baslik: "BİTTİ", mesaj: "Çok iyiydin.  \r Toplam puanın : \(puan)", buttonText: "Tekrar")
            
            
            
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
      
        
        
        //birYildizBtn.isHidden = true
       enYuksek()
       
        
        //
        
        
        //birYildizBtn.butonGorunum("Bir Yıldız", startColor: .red, endColor: .blue)
        
        
        
        //birYildizBtn.setTitle("sikik", for: .normal)
        
        
        
        //
      
        
    }
    
    func setGradientBackground() {
        
        let colorTop =  UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
        
    }
    
    func enYuksek(){
        if sifirla == true {
            
        
            if let sakli = UserDefaults.standard.object(forKey: "sakliScor") as? Int{
                    if puan >= sakli {
                        UserDefaults.standard.set(puan, forKey: "sakliScor")
                    }
                }
        
    
            butonGorunur()
            
            
        }else{
            enYuksekScor.text = ""
        }

    }
    

    func butonGorunur(){
        if let xx = UserDefaults.standard.object(forKey: "sakliScor") as? Int{
            enYuksekScor.text = "\(xx)"
            }
        birYildizBtn.isHidden = false
        geceBtn.isHidden = false
        hastaliklarBtn.isHidden = false
        havaBtn.isHidden = false
        ilkyardimBtn.isHidden = false
        nitrojenBtn.isHidden = false
        planlamaBtn.isHidden = false
    }
    

    @IBAction func soruTabloSec(_ sender: UIButton) {
        
        if sender.tag == 1{konuSec(tablo: "birYildiz", soru: kacSoruOlsun, bank: 56);birYildizBtn.isHidden = true}
        if sender.tag == 2{konuSec(tablo: "gece", soru: kacSoruOlsun, bank: 19);geceBtn.isHidden = true}
        if sender.tag == 3{konuSec(tablo: "hastaliklar", soru: kacSoruOlsun, bank: 51);hastaliklarBtn.isHidden = true}
        if sender.tag == 4{konuSec(tablo: "hava", soru: kacSoruOlsun, bank: 17);havaBtn.isHidden = true}
        if sender.tag == 5{konuSec(tablo: "ilkyardim", soru: kacSoruOlsun, bank: 17);ilkyardimBtn.isHidden = true}
        if sender.tag == 6{konuSec(tablo: "nitrojen", soru: kacSoruOlsun, bank: 26);nitrojenBtn.isHidden = true}
        if sender.tag == 7{konuSec(tablo: "planlama", soru: kacSoruOlsun, bank: 14);planlamaBtn.isHidden = true}
        
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
                
                if sifirla == true {
                    vc?.puan = 0
                }else{
                    vc?.puan = Int(scorLbl.text!)!
                }
                vc?.delegate = self
             }
    }
    
    
    
    func sendDataToFirstViewController(puanim: Int, sifirMi : Bool) {
      
        scorLbl.text = "\(puanim)"
        sifirla = sifirMi
        puan = puanim
        UserDefaults.standard.set(puan, forKey: "puan")
        print(sifirMi)
        
        
    }
    
    
    func alertOlayi(baslik : String, mesaj : String, buttonText : String){


        let alert = UIAlertController(title: baslik, message: mesaj, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: { (alertAction) -> Void in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
    
    
    
}




