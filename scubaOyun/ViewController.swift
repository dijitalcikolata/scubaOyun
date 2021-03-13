//
//  ViewController.swift
//  scubaOyun
//
//  Created by MURAT HASIRCI on 9.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var soruLbl: UILabel!
    @IBOutlet weak var cevapAbtn: UIButton!
    @IBOutlet weak var cevapBbtn: UIButton!
    @IBOutlet weak var cevapCbtn: UIButton!
    @IBOutlet weak var cevapDbtn: UIButton!

    @IBOutlet weak var sayimLbl: UILabel!
    @IBOutlet weak var cevapLbl: UILabel!
   
    
    @IBOutlet weak var naviBar: UINavigationBar!
    
    var cevapNumarasi = 0
    var cevapID = 0
    let db = Databasehandler()
    var tabloGir = ""
    var soruSayisi = 1
    var SoruBankasi = 2
    var soruDizi = [Int]()
    
    let rg = rastgeleSayi()
    
    var timer = Timer()
    let sure = 16
    var counter : Int = 16
    var cevap = 1
    var cevapli = "A"
    var secilenButton = 1
    var puan = 0
    //var sifirlansinMi = Bool()
    
    var delegate:MyDataSendingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.navigationItem.setHidesBackButton(true, animated: true)
        //
        sayim()
        //
        
        puanYazdir()
        
        self.title = "\(tabloGir)"
       
        
        
        print("soru bankası : \(SoruBankasi - 1) | soru sayisi : \(soruSayisi)")
        print(tabloGir)
        
        soruGetir()
        
        
    }
    func sayim(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownMethod), userInfo: nil, repeats: true)
                sayimLbl.text = String(counter)
    }
    func resetSayim(){
                timer.invalidate()
                counter = sure
                sayimLbl.text = String(counter)

        sayim()

    }
    
    @objc func countdownMethod() {
            if counter == 0 {
                timer.invalidate()
                alertOlayi(baslik: "OPPPS!!", mesaj: "Puanınız : \(puan) \r Süre Doldu, Daha Hızlı Olmalısın.", buttonText: "Tekrar Dene")
                //sifirlansinMi = true
            
            } else {
            counter -= 1
            sayimLbl.text = String(counter)

            }
            
        }

   
    @IBAction func cavapSecim(_ sender: UIButton) {
        secilenButton = sender.tag
        if secilenButton == 1 {cevapAbtn.backgroundColor = .green}
        if secilenButton == 2 {cevapBbtn.backgroundColor = .green}
        if secilenButton == 3 {cevapCbtn.backgroundColor = .green}
        if secilenButton == 4 {cevapDbtn.backgroundColor = .green}
        
        buttonAcKapat(acKapat: false)
        
        if sender.tag == cevap{
            timer.invalidate()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.bekleGel(renk: .blue, dogruMu: true)
            }
            
        }else{
            timer.invalidate()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.bekleGel(renk: .red, dogruMu: false)
            }
            print("yanlış")
        }
        
        
    }
    
    
    func puanYazdir(){
        naviBar.topItem?.title = "\(puan)"
        UserDefaults.standard.set(puan, forKey: "puanli")

        
       
        
        
    }
    func toplamPuanKaydet(){
        
       
        if let x = UserDefaults.standard.object(forKey: "puanli") as? Int{
            if puan >= x {
                UserDefaults.standard.set(puan, forKey: "sakliScor")
            }
        }
        
        
    }
    func bekleGel(renk : UIColor, dogruMu : Bool){
        if secilenButton == 1 {cevapAbtn.backgroundColor = renk}
        if secilenButton == 2 {cevapBbtn.backgroundColor = renk}
        if secilenButton == 3 {cevapCbtn.backgroundColor = renk}
        if secilenButton == 4 {cevapDbtn.backgroundColor = renk}
        print("biri bekledi")
        if dogruMu == false {
            print("yanlış")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.ikinciBekleme()
            }
        }else{
            print("doğru")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.ucuncuBekleme()
            }
        }
        
    }
    func ikinciBekleme(){
        
        if cevap == 1{cevapAbtn.backgroundColor = .blue}
        if cevap == 2{cevapBbtn.backgroundColor = .blue}
        if cevap == 3{cevapCbtn.backgroundColor = .blue}
        if cevap == 4{cevapDbtn.backgroundColor = .blue}
        print("ikiyi bekledi")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.oyunBitti()
        }
    
        
    }
    func ucuncuBekleme() {///////////////////////////////
        puan += Int(sayimLbl.text!)!
        puanYazdir()
        soruGetir()
        
        buttonAcKapat(acKapat: true)
        print("üçü bekledi")
        toplamPuanKaydet()
    }
    func buttonAcKapat(acKapat : Bool){
        cevapAbtn.isEnabled = acKapat
        cevapBbtn.isEnabled = acKapat
        cevapCbtn.isEnabled = acKapat
        cevapDbtn.isEnabled = acKapat
    }
    func oyunBitti(){
        
        alertOlayi(baslik: "Yanlış!", mesaj: "Puanınız : \(puan) \r Tekrar Denemelisin", buttonText: "TEKRAR DENE")
        //sifirlansinMi = true
        
    }
    
    func puanGonder(){
        if self.delegate != nil {
           let sendText = String(puan)
           self.delegate?.sendDataToFirstViewController(puanim: sendText)
           dismiss(animated: true, completion: nil) //for close this view
        }
        
    }
    
    
    func soruGetir(){
        
        cevapAbtn.backgroundColor = .orange
        cevapBbtn.backgroundColor = .orange
        cevapCbtn.backgroundColor = .orange
        cevapDbtn.backgroundColor = .orange
        
        soruDizi = rg.bokubok(soruAdet: soruSayisi, soruBankaAdet: SoruBankasi)
        print(soruDizi)
        
        if  cevapID <= soruDizi.count - 1{
            resetSayim()
            let bok = db.readOnlyOne(id: soruDizi[cevapID], tablo: "\(tabloGir)")
        
        
            if bok[5] == "A"{cevapNumarasi = 1}
            else if bok[5] == "B"{cevapNumarasi = 2}
            else if bok[5] == "C"{cevapNumarasi = 3}
            else {cevapNumarasi = 4}
        
            soruLbl.text = bok[0]
            cevapAbtn.setTitle(bok[1], for: UIControl.State.normal)
            cevapBbtn.setTitle(bok[2], for: UIControl.State.normal)
            cevapCbtn.setTitle(bok[3], for: UIControl.State.normal)
            cevapDbtn.setTitle(bok[4], for: UIControl.State.normal)
            cevapLbl.text = bok[5]
            cevapli = bok[5]
            
            
            if cevapli == "A"{cevap = 1}
            if cevapli == "B"{cevap = 2}
            if cevapli == "C"{cevap = 3}
            if cevapli == "D"{cevap = 4}
            
            
            
            cevapID += 1
    
        }else{
            //sifirlansinMi = false
            alertOlayi(baslik: "GÜZEL!", mesaj: "Puanınız : \(puan) \r Haydi Devam Edelim.", buttonText: "DEVAM")
            
        }
    }
    
    
    
    func alertOlayi(baslik : String, mesaj : String, buttonText : String){

        puanGonder()
        soruDizi.removeAll()

        let alert = UIAlertController(title: baslik, message: mesaj, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: { (alertAction) -> Void in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
  /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
             
             if segue.destination is secimViewController{
                let vc = segue.destination as? secimViewController
                vc?.sifirla = sifirlansinMi
                
             }
    }
    
    */
    
    
}





protocol MyDataSendingDelegate {
   func sendDataToFirstViewController(puanim: String)
}
