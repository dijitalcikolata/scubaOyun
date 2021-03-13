//
//  Rastgele.swift
//  scubaOyun
//
//  Created by MURAT HASIRCI on 10.03.2021.
//

import Foundation
import UIKit


class rastgeleSayi {
    
    
    
    
    var rastgeleDizi : [Int] = []
    
    func bokubok(soruAdet: Int, soruBankaAdet: Int) -> [Int] {
        
        
    while rastgeleDizi.count < soruAdet {
  
        let uretilen = Int.random(in: 1..<soruBankaAdet)
        if (rastgeleDizi.firstIndex(of: uretilen) == nil ){
            rastgeleDizi.append(uretilen)
        }
        
    }
    
    //print(rastgeleDizi)
    
        return rastgeleDizi
    }
    
    
    
    
    
    
    
    
}
