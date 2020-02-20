//
//  main.swift
//  Jsonfile.swift
//
//  Created by MacStudent on 2020-02-19.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

func readTextFile(Filename: String)
{
  //  print(Bundle.main.bundlePath)
 if let path =  Bundle.main.path(forResource: Filename, ofType: "txt") // just give the path
   // print(path)
 {
    let str = try? String(contentsOfFile: path)
    if let s = str {
        print(s)
    }else{
        print("error while reading file content")
    }
    print(str)
}
}
//readTextFile(Filename: "data")
/*func readJsonFile(Filename: String)
{
     if let path = Bundle.main.path(forResource: Filename, ofType: "json")

{
    let abc = try!String(contentsOfFile: path)
    print(abc)
}
}
//readJsonFile(Filename: "SingleUser")*/


func readJsonFile(Filename: String)
{
    
    let filePath = Bundle.main.url(forResource: Filename, withExtension: "json")
    
guard let path = filePath else {
    print("Invalid file path found")
    return
    
    }
    guard let data =  try? Data(contentsOf: path) else{
        print("error while read data from url")
        return
    }
    guard  let json = try? JSONSerialization.jsonObject(with: data, options: [])  else {
    print("error while reading json data from file")
    return
}
//print(json)
    if let  userDictionary = json as? [String : Any] {
       // print(userDictionary)
       let id = userDictionary["id"] ?? " No id found"
        
            print(id)
            // like wise fetch all other values except address andcompany as it is another  dictionary
            if let addressDictionary = userDictionary["address"] as? [String : Any ]
            {
                print(addressDictionary["city"]!)
            }
        }
    }


readJsonFile(Filename: "SingleUser")
