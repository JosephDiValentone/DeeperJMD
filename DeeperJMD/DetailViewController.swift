//
//  DetailViewController.swift
//  DeeperJMD
//
//  Created by Joseph Divalentone on 3/18/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        detailsetup()
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
    }
    
    
    
    // set up the main variables for the storyboard
    
    @IBOutlet weak var moviePicImageView: UIImageView!
    @IBOutlet weak var TitleL: UILabel!
    @IBOutlet weak var YearL: UILabel!
    @IBOutlet weak var FormatL: UILabel!
    @IBOutlet weak var EpiL: UILabel!
    @IBOutlet weak var StudL: UILabel!
    
    @IBOutlet weak var TextFT: UITextView!
    
    var ShowDet: ShowEntries?
    
    // populating the details or the specIFIC MOVIEsnoktnb
    func detailsetup() {
        if let ShowDet = ShowDet {
            self.navigationItem.title = ShowDet.name
            TitleL.text = ShowDet.name
            YearL.text = ShowDet.yearStart
            FormatL.text = ShowDet.format
            if let epiNum = ShowDet.episodes{
                EpiL.text = "\(epiNum)"
            }
            StudL.text = ShowDet.network
            getItImage (url: URL(string: ShowDet.imageURL!)!) { (image, error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                DispatchQueue.main.async {
                 self.moviePicImageView.image = image
                }
                
            }
            
            
        }
        
        
        
        
        
        
    }
    
    
    // now the image getting so the app doesnt mess up and things runn smoother
    
    func getItImage(url:URL, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void){
        
        var pic: UIImage?
        let session = URLSession.shared
        let task = session.downloadTask(with: url) { (fileURL, response, error) in
            // catch the error
            if error != nil{
                completion(pic,error)
                return
            }
            // if no error then make the picture what you pull from the file
            if let fileURL = fileURL{
                do{
                    let data = try Data(contentsOf: fileURL)
                    pic = UIImage(data: data)
                }catch {
                    completion(pic,error)
                    return
                }
            }
            completion(pic,error)
        }
        task.resume()
    }


}

