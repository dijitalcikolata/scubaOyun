//
//  secimViewController.swift
//  scubaOyun
//
//  Created by MURAT HASIRCI on 10.03.2021.
//

import UIKit


var buyuyenView : UIView = {
    let vie = UIView()
    vie.translatesAutoresizingMaskIntoConstraints = false
    vie.backgroundColor = UIColor.systemPink
        return vie
    }()
let logoImg: UIImageView = {
    let theImageView = UIImageView()
   theImageView.image = UIImage(named: "kuru2")
   return theImageView
}()
let scubaImg: UIImageView = {
    let theImageView = UIImageView()
   theImageView.image = UIImage(named: "scuba")
   return theImageView
}()
let baslaBtn: UIButton = {
   let btn = UIButton()
    btn.setTitle("BAŞLA", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let birYildizBtn: UIButton = {
   let btn = UIButton()
    btn.setTitle("Bir Yildiz", for: .normal)
    btn.backgroundColor = UIColor.systemBlue
    return btn
}()
let ikiYildizBtn: UIButton = {
   let btn = UIButton()
    btn.setTitle("İki Yildiz", for: .normal)
    btn.backgroundColor = UIColor.systemBlue
    return btn
}()
let ucYildizBtn: UIButton = {
   let btn = UIButton()
    btn.setTitle("Üç Yildiz", for: .normal)
    btn.backgroundColor = UIColor.systemBlue
    return btn
}()

let konu1Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("1", for: .normal)
    btn.backgroundColor = UIColor.systemBlue
    return btn
}()
let konu21Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("2", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu22Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("3", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu23Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("4", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu24Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("5", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu25Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("6", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu26Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("7", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu31Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("2", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu32Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("3", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu33Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("4", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu34Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("5", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu35Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("6", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()
let konu36Btn: UIButton = {
   let btn = UIButton()
    btn.setTitle("7", for: .normal)
    btn.backgroundColor = UIColor.systemPink
    return btn
}()


let konum = Konumlar()
let animasyon = Animasyon()
var secim = 0


class secimViewController: UIViewController, MyDataSendingDelegate {
  
    
   
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
        
        if konu1Btn.isHidden == true && konu31Btn.isHidden == true && konu32Btn.isHidden == true && konu33Btn.isHidden == true && konu34Btn.isHidden == true && konu35Btn.isHidden == true && konu36Btn.isHidden == true {
            
            sifirla = true
            butonGorunur()
            alertOlayi(baslik: "BİTTİ", mesaj: "Çok iyiydin.  \r Toplam puanın : \(puan)", buttonText: "Tekrar")
            
            
            
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setGradientBackground()
      
        view.addSubview(buyuyenView)
        view.addSubview(birYildizBtn)
        view.addSubview(ikiYildizBtn)
        view.addSubview(ucYildizBtn)
        view.addSubview(logoImg)
        view.addSubview(scubaImg)
        
        konum.baslaKonum(view: view, baslaBtn: baslaBtn)
        
        baslaBtn.tag = 0
        
        birYildizBtn.tag = 1
        ikiYildizBtn.tag = 2
        ucYildizBtn.tag = 3
        
        konu1Btn.tag = 11
        
        konu21Btn.tag = 21
        konu22Btn.tag = 22
        konu23Btn.tag = 23
        konu24Btn.tag = 24
        konu25Btn.tag = 25
        konu26Btn.tag = 26
        
        konu31Btn.tag = 31
        konu32Btn.tag = 32
        konu33Btn.tag = 33
        konu34Btn.tag = 34
        konu35Btn.tag = 35
        konu36Btn.tag = 36
        
        
        baslaBtn.addTarget(self, action:  #selector(buttonPressed), for: .touchUpInside)
        
        birYildizBtn.addTarget(self, action:  #selector(buttonPressed), for: .touchUpInside)
        ikiYildizBtn.addTarget(self, action:  #selector(buttonPressed), for: .touchUpInside)
        ucYildizBtn.addTarget(self, action:  #selector(buttonPressed), for: .touchUpInside)
        
        konu1Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        
        konu21Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        konu22Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        konu23Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        konu24Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        konu25Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        konu26Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        
        konu31Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        konu32Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        konu33Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        konu34Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        konu35Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        konu36Btn.addTarget(self, action:  #selector(secimViewController.soruTabloSec(_:)), for: .touchUpInside)
        
        //konu1Btn.isHidden = true
       enYuksek()
       
        
        //
        
        
        //konu1Btn.butonGorunum("Bir Yıldız", startColor: .red, endColor: .blue)
        
        
        
        //konu1Btn.setTitle("sikik", for: .normal)
        
        
        
        //
      
        
    }
    
    
    @objc func buttonPressed(sender : Any){
        
        
        switch (sender as AnyObject).tag
            {
                case 0: print("0")
                    secim = 0
                    baslaKonum()//when Button1 is clicked...
                    break
                case 1: print("1")
                    
                    /*
                    konu31Btn.isHidden = true
                    konu32Btn.isHidden = true
                    konu33Btn.isHidden = true
                    konu34Btn.isHidden = true
                    konu35Btn.isHidden = true
                    konu36Btn.isHidden = true
 */
                    secim = 1
                    birYildiz()//when Button1 is clicked...
                    break
                case 2: print("2")     //when Button2 is clicked...
                    konu1Btn.isHidden = true
                    
                    secim = 2
                    ikiYildiz()
                    break
                case 3: print("3")     //when Button3 is clicked...
                    konu1Btn.isHidden = true
                    
                    secim = 3
                    ucYildiz()
                    break
                default: print("Other...")
            }
        
    }
    func baslaKonum(){
        baslaBtn.isHidden = true
        secim = 0
        
        animasyon.gecisAnimasyon(buyuyenView: buyuyenView, view: view, logoImg: logoImg, secim : secim, scubaImg : scubaImg)
        
        
        konum.kategoriKonum(view: view, birYildizBtn: birYildizBtn, ikiYildizBtn: ikiYildizBtn, ucYildizBtn: ucYildizBtn)
        
        view.sendSubviewToBack(birYildizBtn)
        view.sendSubviewToBack(ikiYildizBtn)
        view.sendSubviewToBack(ucYildizBtn)
        
    }
    func konuKonum(){
        
        animasyon.gecisAnimasyon(buyuyenView: buyuyenView, view: view, logoImg: logoImg, secim : secim, scubaImg : scubaImg)
        
        //konum.konuKonum(view: view, konu1Btn: konu1Btn, konuABtn: konu31Btn, konuBBtn: konu32Btn, konuCBtn: konu33Btn, konuDBtn: konu34Btn, konuEBtn: konu35Btn, konuFBtn: konu36Btn)
        
        birYildizBtn.isHidden = true
        ikiYildizBtn.isHidden = true
        ucYildizBtn.isHidden = true
        
        view.sendSubviewToBack(konu1Btn)
        view.sendSubviewToBack(konu21Btn)
        view.sendSubviewToBack(konu22Btn)
        view.sendSubviewToBack(konu23Btn)
        view.sendSubviewToBack(konu24Btn)
        view.sendSubviewToBack(konu25Btn)
        view.sendSubviewToBack(konu26Btn)
        view.sendSubviewToBack(konu31Btn)
        view.sendSubviewToBack(konu32Btn)
        view.sendSubviewToBack(konu33Btn)
        view.sendSubviewToBack(konu34Btn)
        view.sendSubviewToBack(konu35Btn)
        view.sendSubviewToBack(konu36Btn)
        
    }
    
    func birYildiz(){
        
        konum.konuKonumBir(view: view, konu1Btn: konu1Btn)
        
        konuKonum()
        
        konu1Btn.setTitle("1 Yıldız Sorular", for: .normal)
       
    }
    func ikiYildiz(){
        
        konum.konuKonum(view: view, konuABtn: konu21Btn, konuBBtn: konu22Btn, konuCBtn: konu23Btn, konuDBtn: konu24Btn, konuEBtn: konu25Btn, konuFBtn: konu26Btn)
        
        konuKonum()
        //konu1Btn.setTitle("iki1", for: .normal)
        konu21Btn.setTitle("DALIŞ HASTALIKLARI", for: .normal)
        konu22Btn.setTitle("İLKYARDIM", for: .normal)
        konu23Btn.setTitle("HAVA HESAPLAMALARI - DEKO", for: .normal)
        konu24Btn.setTitle("NİTROJEN EMİLİMİNİ", for: .normal)
        konu25Btn.setTitle("DERİN GECE DALIŞI", for: .normal)
        konu26Btn.setTitle("PLANLAMA - NAVİGASYON", for: .normal)
        
    }
    func ucYildiz(){
       
        konum.konuKonum(view: view, konuABtn: konu31Btn, konuBBtn: konu32Btn, konuCBtn: konu33Btn, konuDBtn: konu34Btn, konuEBtn: konu35Btn, konuFBtn: konu36Btn)
        konuKonum()
        //konu1Btn.setTitle("uc1", for: .normal)
        konu31Btn.setTitle("KÜÇÜK TEKNE - ARAMA KURTARMA", for: .normal)
        konu32Btn.setTitle("NAVİGASYON", for: .normal)
        konu33Btn.setTitle("KOMPRESOR KULLANIMI - DALIŞ MALZ.", for: .normal)
        konu34Btn.setTitle("PROBLEM YONETİMİ", for: .normal)
        konu35Btn.setTitle("GRUP DALIŞ ORGANİZASYONU", for: .normal)
        konu36Btn.setTitle("FİZİK FİZYOLOJİ", for: .normal)
        
        
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
        konu1Btn.isHidden = false
        konu31Btn.isHidden = false
        konu32Btn.isHidden = false
        konu33Btn.isHidden = false
        konu34Btn.isHidden = false
        konu35Btn.isHidden = false
        konu36Btn.isHidden = false
    }
    

    @objc func soruTabloSec(_ sender: UIButton) {
        
        if sender.tag == 11{konuSec(tablo: "birYildiz", soru: kacSoruOlsun, bank: 56);konu1Btn.isHidden = true}
        if sender.tag == 21{konuSec(tablo: "dalisHastaliklariIki", soru: kacSoruOlsun, bank: 88);konu31Btn.isHidden = true}
        if sender.tag == 22{konuSec(tablo: "ilkyardimIki", soru: kacSoruOlsun, bank: 28);konu32Btn.isHidden = true}
        if sender.tag == 23{konuSec(tablo: "havaDekoIki", soru: kacSoruOlsun, bank: 25);konu33Btn.isHidden = true}
        if sender.tag == 24{konuSec(tablo: "nitrojenIki", soru: kacSoruOlsun, bank: 31);konu34Btn.isHidden = true}
        if sender.tag == 25{konuSec(tablo: "derinIki", soru: kacSoruOlsun, bank: 31);konu35Btn.isHidden = true}
        if sender.tag == 26{konuSec(tablo: "planIki", soru: kacSoruOlsun, bank: 19);konu36Btn.isHidden = true}
        if sender.tag == 31{konuSec(tablo: "tekneUc", soru: kacSoruOlsun, bank: 13);konu31Btn.isHidden = true}
        if sender.tag == 32{konuSec(tablo: "navigasyonUc", soru: kacSoruOlsun, bank: 11);konu32Btn.isHidden = true}
        if sender.tag == 33{konuSec(tablo: "kompresorUc", soru: kacSoruOlsun, bank: 21);konu33Btn.isHidden = true}
        if sender.tag == 34{konuSec(tablo: "problemUc", soru: kacSoruOlsun, bank: 17);konu34Btn.isHidden = true}
        if sender.tag == 35{konuSec(tablo: "grupUc", soru: kacSoruOlsun, bank: 11);konu35Btn.isHidden = true}
        if sender.tag == 36{konuSec(tablo: "fizikUc", soru: kacSoruOlsun, bank: 25);konu36Btn.isHidden = true}
        
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




