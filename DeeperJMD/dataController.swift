//
//  dataController.swift
//  DeeperJMD
//
//  Created by Joseph Divalentone on 3/22/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//


import UIKit

class dataController {
    // have the url thatis updating
    let jsonURL = "https://api.myjson.com/bins/1e5uji"
    var MDM = MovieDataModel()
    func getData (completion: @escaping (_ success:MovieDataModel) -> ()){
 
        //make the variable for the model to be put into
        
        //make the url a string
        let jurl = URL(string: jsonURL)
        // make the session
        let session = URLSession.shared
        // stil off formatting to me but I guess its what works
        //start the task of grabbing with the session
        let task = session.dataTask(with: jurl!) {(data,response, error) in
            
            if error != nil {
                completion(self.MDM)
                return
            }
            
            guard let data = data else {
                // call the decoder and run it through the model
                return
            }
            
                do{
                let decoder = JSONDecoder()
                let mediaData = try decoder.decode(MovieDataModel.self, from: data)
                self.MDM = mediaData
                }catch{
                        print("jeki5786")
                    return
                }
                
            
            DispatchQueue.main.async{
                completion(self.MDM as! MovieDataModel)
            }
        }
        task.resume()
    }
   
}

