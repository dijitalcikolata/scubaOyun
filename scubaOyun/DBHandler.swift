//
//  DBHandler.swift
//  first design
//
//  Created by Haris Mir on 23/10/2019.
//  Copyright © 2019 haris. All rights reserved.
//

import Foundation
import SQLite3

class Databasehandler {
    let databaseName : String = "scubaTumV1"
    let databaseExtension : String = "db"
    var db : OpaquePointer! = nil
    var soruArray = [String]()
    //var tabloSecim = "gece"
    
    
    init() {
         prepareDatafile()
         db = openDatabase()
    }
    
    
    
      
    func readOnlyOne(id:Int, tablo : String) -> [String] {
          let queryStatementString = "SELECT * FROM \(tablo) WHERE Id = \(id);"
          var queryStatement: OpaquePointer? = nil
          
          if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
              while sqlite3_step(queryStatement) == SQLITE_ROW {
               //let id = sqlite3_column_int(queryStatement, 0)
               let soru = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let cevapA = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let cevapB = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let cevapC = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let cevapD = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                let cevap = String(describing: String(cString: sqlite3_column_text(queryStatement, 6)))
               
               //psns.append(Sorular(id: Int(id), name : name, email : email, password : password))
                
                  //print("Sorgu Sonucu : ")
               //print("id : \(id) \r \(soru) \r \(cevapA) \r \(cevapB) \r \(cevapC) \r \(cevapD) \r \(cevap)")
               
                soruArray = [soru,cevapA,cevapB,cevapC,cevapD,cevap]
                
              }
          } else {
              print("SELECT statement could not be prepared")
          }
          sqlite3_finalize(queryStatement)
        return soruArray
      }
      
  
    
    /////////////////////////////
    //Copy database for fist time
    /////////////////////////////
    func prepareDatafile()
    {
        let docUrl=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //print(docUrl)
        let fdoc_url=URL(fileURLWithPath: docUrl).appendingPathComponent("\(databaseName).\(databaseExtension)")
        
        let filemanager=FileManager.default
        
        if !FileManager.default.fileExists(atPath: fdoc_url.path){
            do{
                let localUrl=Bundle.main.url(forResource: databaseName, withExtension: databaseExtension)
                //print(localUrl?.path ?? "")
                
                try filemanager.copyItem(atPath: (localUrl?.path)!, toPath: fdoc_url.path)
                
                print("Database copied to simulator-device")
            }catch
            {
                print("error while copying")
            }
        }
        else{
            print("Database alreayd exists in similator-device")
        }
    }
    
    
    
    /////////////////////////////////////
    /////Open Connection to Database
    ////////////////////////////////////
    func openDatabase() -> OpaquePointer? {
        
        let docUrl=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //print(docUrl)
        let fdoc_url=URL(fileURLWithPath: docUrl).appendingPathComponent("\(databaseName).\(databaseExtension)")
        
        var db: OpaquePointer? = nil
        
        if sqlite3_open(fdoc_url.path, &db) == SQLITE_OK {
            //print("DB Connection Opened, Path is :: \(fdoc_url.path)")
            return db
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                "in the Getting Started section.")
            return nil
        }
        
    }
 
}
