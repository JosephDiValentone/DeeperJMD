//
//  dataController.swift
//  DeeperJMD
//
//  Created by Joseph Divalentone on 3/22/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//

import Foundation
import UIKit

class dataController: NSObject {
    func getData(completion: @escaping (_ success:Data) -> ()){
        var success = Data
        let actualURL = URL(string: jsonURL)
        
        let task = URLSession.shared.dataTask(with: actualURL!) {(data, response, error) in
            
            if let _ =  data, error == nil {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
                    
                    if let movieArray = jsonObj!.value(forKey: "Franchise") as? Array<String>{
                        self.dataArray = movieArray
                        
                        
                        print(jsonObj!.value(forKey: "Franchise")! )
                    }
                }
            }else {
                success = false
            }
            completion(success)
        }
        task.resume()
    }

}
