//
//  ViewController.swift
//  scubaOyun
//
//  Created by MURAT HASIRCI on 9.03.2021.
//

import UIKit

class ViewController: UIViewController {
    //***
    
    let soruLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "Label label Label label Label label Label label Label label Label label Label label Label label Label label Label label Label label Label label Label label Label label "
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    let cevapAbtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("cevapA", for: .normal)
        btn.backgroundColor = UIColor.systemOrange
        return btn
    }()
    let cevapBbtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("cevapB", for: .normal)
        btn.backgroundColor = UIColor.systemOrange
        return btn
    }()
    let cevapCbtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("cevapC", for: .normal)
        btn.backgroundColor = UIColor.systemOrange
        return btn
    }()
    let cevapDbtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("cevapD", for: .normal)
        btn.backgroundColor = UIColor.systemOrange
        return btn
    }()
    
    //***
    var buyuyenView : UIView = {
        let vie = UIView()
        vie.translatesAutoresizingMaskIntoConstraints = false
            return vie
        }()
    
    let logoImg: UIImageView = {
        let theImageView = UIImageView()
       theImageView.image = UIImage(named: "kuru2")
       return theImageView
    }()
    let muratImg: UIImageView = {
        let theImageView = UIImageView()
       theImageView.image = UIImage(named: "murti")
       return theImageView
    }()
    let hasirciImg: UIImageView = {
        let theImageView = UIImageView()
       theImageView.image = UIImage(named: "hasirci")
       return theImageView
    }()
    let tamamImg: UIImageView = {
        let theImageView = UIImageView()
       theImageView.image = UIImage(named: "tamam")
       return theImageView
    }()
    let hayirImg: UIImageView = {
        let theImageView = UIImageView()
       theImageView.image = UIImage(named: "hayir")
       return theImageView
    }()
    let mukemmelImg: UIImageView = {
        let theImageView = UIImageView()
       theImageView.image = UIImage(named: "mukemmel")
       return theImageView
    }()
    let oyunBittiImg: UIImageView = {
        let theImageView = UIImageView()
       theImageView.image = UIImage(named: "oyunBitti")
       return theImageView
    }()
    let sureBittiImg: UIImageView = {
        let theImageView = UIImageView()
       theImageView.image = UIImage(named: "sureBitti")
       return theImageView
    }()
    let tamamBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("TAMAM", for: .normal)
        btn.backgroundColor = UIColor.systemGray
        return btn
    }()
    let puanGosterLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "0"
        lbl.textAlignment = .center
        return lbl
    }()
    
    var timerHizli = Timer()
    var say = 0
    
    let konumlar = Konumlar()
    let animasyon = Animasyon()
    
    
    @IBOutlet weak var sayimLbl: UILabel!
    @IBOutlet weak var cevapLbl: UILabel!
    @IBOutlet weak var naviBar: UINavigationBar!
    
    @IBOutlet weak var progressBar1: ProgressBar!
    @IBOutlet weak var diziLbl: UILabel!
    
    
    var countFired: CGFloat = 0
    
    var cevapNumarasi = 0
    var cevapID = 0
    let db = Databasehandler()
    var tabloGir = ""
    var soruSayisi = 1
    var SoruBankasi = 2
    var soruDizi = [Int]()
    
    let rg = rastgeleSayi()
    
    var timer = Timer()
    let sure = 50
    var counter : Int = 50
    var cevap = 1
    var cevapli = "A"
    var secilenButton = 1
    var puan = 0
    var sifirlansinMi = Bool()
    
    var delegate:MyDataSendingDelegate?
    
    override func viewDidLoad() {
        setGradientBackground()
        super.viewDidLoad()
        
        
        
        
        
      //*
        
        view.addSubview(soruLbl)
        view.addSubview(cevapAbtn)
        view.addSubview(cevapBbtn)
        view.addSubview(cevapCbtn)
        view.addSubview(cevapDbtn)
        view.addSubview(buyuyenView)
        view.addSubview(logoImg)
        view.addSubview(muratImg)
        view.addSubview(hasirciImg)
        view.addSubview(tamamImg)
        view.addSubview(mukemmelImg)
        view.addSubview(hayirImg)
        view.addSubview(oyunBittiImg)
        view.addSubview(sureBittiImg)
        view.addSubview(tamamBtn)
        view.addSubview(puanGosterLbl)
        
        cevapAbtn.tag = 1
        cevapBbtn.tag = 2
        cevapCbtn.tag = 3
        cevapDbtn.tag = 4
        
        cevapAbtn.addTarget(self, action:  #selector(ViewController.cavapSecim(_:)), for: .touchUpInside)
        cevapBbtn.addTarget(self, action:  #selector(ViewController.cavapSecim(_:)), for: .touchUpInside)
        cevapCbtn.addTarget(self, action:  #selector(ViewController.cavapSecim(_:)), for: .touchUpInside)
        cevapDbtn.addTarget(self, action:  #selector(ViewController.cavapSecim(_:)), for: .touchUpInside)
        
        soruLbl.anchor(top: progressBar1.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 40, paddingBottom: 0, paddingLeft: 10, paddingRight: -10, width: 0, height: 0)
        cevapAbtn.anchor(top: soruLbl.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 30, paddingBottom: 0, paddingLeft: 10, paddingRight: -10, width: 0, height: 0)
        cevapBbtn.anchor(top: cevapAbtn.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 10, paddingRight: -10, width: 0, height: 0)
        cevapCbtn.anchor(top: cevapBbtn.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 10, paddingRight: -10, width: 0, height: 0)
        cevapDbtn.anchor(top: cevapCbtn.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 10, paddingRight: -10, width: 0, height: 0)
        
        let boyX = Int(UIScreen.main.bounds.width)
        let boyY = Int(UIScreen.main.bounds.height)
        
        animasyon.konumAnim(gelenImg: logoImg, X: boyX/2 - 100, Y: 100, W: 200, H: 155, gorunurluk: 0)
        animasyon.konumAnim(gelenImg: muratImg, X: 1000, Y: 255, W: 100, H: 25, gorunurluk: 1)
        animasyon.konumAnim(gelenImg: hasirciImg, X: -500, Y: 280, W: 100, H: 25, gorunurluk: 1)
        animasyon.konumAnim(gelenImg: tamamImg, X: boyX/2 - 125, Y: boyY - 275, W: 250, H: 275, gorunurluk: 0)
        animasyon.konumAnim(gelenImg: hayirImg, X: boyX/2 - 125, Y: boyY - 275, W: 250, H: 275, gorunurluk: 0)
        animasyon.konumAnim(gelenImg: mukemmelImg, X: boyX / 2 - 100, Y: boyY / 2 , W: 200, H: 45, gorunurluk: 0)
        animasyon.konumAnim(gelenImg: oyunBittiImg, X: boyX / 2 - 100, Y: boyY / 2 , W: 200, H: 45, gorunurluk: 0)
        animasyon.konumAnim(gelenImg: sureBittiImg, X: boyX / 2 - 100, Y: boyY / 2 , W: 200, H: 45, gorunurluk: 0)
        
        
        tamamBtn.alpha = 0
        tamamBtn.anchor(top: puanGosterLbl.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0 , height: 30)
    
        tamamBtn.addTarget(self, action:  #selector(ViewController.tamamBtn(_:)), for: .touchUpInside)
        puanGosterLbl.alpha = 0
        puanGosterLbl.anchor(top: hasirciImg.bottomAnchor, bottom: tamamBtn.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerx: nil, paddingTop: 10, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 30)
         
        //*/
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        //
        sayimBasla(gorunum: false, sayayimMi: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.sayimBasla(gorunum: true, sayayimMi: true)
        }
        
        //
        
        
        cevapAbtn.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 2.0, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.cevapAbtn.center.x = self.view.frame.width / 50
        },completion: nil)
        cevapBbtn.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 2.5, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.cevapBbtn.center.x = self.view.frame.width / 50
        },completion: nil)
        cevapCbtn.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 3.0, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.cevapCbtn.center.x = self.view.frame.width / 50
        },completion: nil)
        cevapDbtn.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 3.5, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.cevapDbtn.center.x = self.view.frame.width / 50
        },completion: nil)
        
        soruLbl.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 1.0, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.soruLbl.center.x = self.view.frame.width / 50
        },completion: nil)
        
        
        
        
        //
        puanYazdir()
        
        self.title = "\(tabloGir)"
       
        
        
        print("soru bankası : \(SoruBankasi - 1) | soru sayisi : \(soruSayisi)")
        print(tabloGir)
        
        soruGetir()
        buttonStyle()
        
        
        
    }
    //*****
    @objc func tamamBtn(_ sender : Any){
      
        animasyon.geriAnimasyonsonucImg(hayirImg: hayirImg, evetImg: tamamImg, logoImg: logoImg, muratImg: muratImg, hasirciImg: hasirciImg, buyuyenView: buyuyenView, tamamBtn: tamamBtn, mukemmelImg: mukemmelImg, oyunBitti: oyunBittiImg, sureBittiImg : sureBittiImg)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.navigationController?.popViewController(animated: true)
            print("kapat kız")
        }
    }
    
    
    func dogruYanlis(gelenSonucImg : UIImageView, gelenTextImg : UIImageView, gelenColor : UIColor){
        animasyon.animasyonBasla(buyuyenView: buyuyenView, view: view)
        animasyon.butonHareket(sonucImg: gelenSonucImg, sonucTextImg: gelenTextImg, logoImg: logoImg, muratImg: muratImg, hasirciImg: hasirciImg, buyuyenView : buyuyenView, color : gelenColor, tamamBtn : tamamBtn, puanGosterLbl: puanGosterLbl)
        
        
    }
    //*****
    
    func setGradientBackground() {
        
        let colorTop =  UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    func sayimBasla(gorunum : Bool, sayayimMi: Bool){
        cevapAbtn.isEnabled = gorunum
        cevapBbtn.isEnabled = gorunum
        cevapCbtn.isEnabled = gorunum
        cevapDbtn.isEnabled = gorunum
        if sayayimMi == true{sayim()}
    }
    func buttonStyle(){
        
        cevapAbtn.layer.cornerRadius = 8
        cevapBbtn.layer.cornerRadius = 8
        cevapCbtn.layer.cornerRadius = 8
        cevapDbtn.layer.cornerRadius = 8
    }
    
    func sayim(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownMethod), userInfo: nil, repeats: true)
                sayimLbl.text = String(counter)
    }
    func resetSayim(){
                timer.invalidate()
                counter = sure
                sayimLbl.text = String(counter)

        //sayim()

    }
    
    @objc func countdownMethod() {
            if counter == 0 {
                timer.invalidate()
                sifirlansinMi = true
                alertOlayi()
                //alertOlayi(baslik: "OPPPS!!", mesaj: "Puanınız : \(puan) \r Süre Doldu, Daha Hızlı Olmalısın.", buttonText: "Tekrar Dene")
                //puanGosterLbl.text = "\(puan)"
                hizliSay()
                dogruYanlis(gelenSonucImg: hayirImg, gelenTextImg: sureBittiImg, gelenColor: .systemPink)
            
            } else {
            counter -= 1
            sayimLbl.text = String(counter)
                self.progressBar1.progress = (CGFloat(truncating: NSNumber(value: counter)) / 50)
            }
            
        }

   
    @objc func cavapSecim(_ sender: UIButton) {
        sender.shake()
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
        
        if cevap == 1{cevapAbtn.backgroundColor = .blue;self.cevapAbtn.flash()}
        if cevap == 2{cevapBbtn.backgroundColor = .blue;self.cevapBbtn.flash()}
        if cevap == 3{cevapCbtn.backgroundColor = .blue;self.cevapCbtn.flash()}
        if cevap == 4{cevapDbtn.backgroundColor = .blue;self.cevapDbtn.flash()}
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
        
    }
    func buttonAcKapat(acKapat : Bool){
        cevapAbtn.isEnabled = acKapat
        cevapBbtn.isEnabled = acKapat
        cevapCbtn.isEnabled = acKapat
        cevapDbtn.isEnabled = acKapat
    }
    func oyunBitti(){
        sifirlansinMi = true
        alertOlayi()
        //alertOlayi(baslik: "Yanlış!", mesaj: "Puanınız : \(puan) \r Tekrar Denemelisin", buttonText: "TEKRAR DENE")
        //puanGosterLbl.text = "\(puan)"
        hizliSay()
        dogruYanlis(gelenSonucImg: hayirImg, gelenTextImg: oyunBittiImg, gelenColor: .systemPink)
        
    }
    
    func puanGonder(){
        if self.delegate != nil {
           let sendText = puan
            let sifir = sifirlansinMi
            self.delegate?.sendDataToFirstViewController(puanim: sendText, sifirMi : sifir)
           dismiss(animated: true, completion: nil) //for close this view
        }
        
    }
    
    
    func hizliSay(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            self.timerHizli = Timer.scheduledTimer(timeInterval: 0.01, target:self, selector:#selector(self.prozessTimer), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func prozessTimer() {
        if say != puan{
        say += 1
            puanGosterLbl.text = "\(say)"
            print("\(say)")
        }else{
            timerHizli.invalidate()
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
        
        
            diziLbl.text = "\(tabloGir) : \(soruDizi)"
            
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
            sifirlansinMi = false
            //alertOlayi(baslik: "GÜZEL!", mesaj: "Puanınız : \(puan) \r Haydi Devam Edelim.", buttonText: "DEVAM")
            alertOlayi()
            //puanGosterLbl.text = "\(puan)"
            hizliSay()
            dogruYanlis(gelenSonucImg: tamamImg, gelenTextImg: mukemmelImg, gelenColor: .systemBlue)
        }
    }
    
    
    
    func alertOlayi(){

        puanGonder()
        soruDizi.removeAll()
        
/*
        let alert = UIAlertController(title: baslik, message: mesaj, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: { (alertAction) -> Void in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true)
 */
 }
  
    
    
    private func showCase() {
    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
      self.countFired += 1
      
      DispatchQueue.main.async {
        self.progressBar1.progress = min(CGFloat(0.04 * self.countFired), 1)
        
        
        if self.progressBar1.progress == 1 {
          timer.invalidate()
        }
      }
    }
  }
    
    
}





protocol MyDataSendingDelegate {
   func sendDataToFirstViewController(puanim: Int, sifirMi : Bool)
}
