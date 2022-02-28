//
//  FetchFlagListData.swift
//  FlagAppIOS
//
//  Created by Ankit Raj on 25/02/22.
//

import Foundation

class FetchFlagListData{
    
    func fetchData(completionHandler:@escaping ([FlagList])-> Void){
        var flagListSpaces = [FlagList]()
        
        //we will now call the api here
        if let urlToServer = URL.init(string: "https://disease.sh/v2/countries"){
            
            let task = URLSession.shared.dataTask(with: urlToServer,completionHandler: { (data, response, error) in
                
                if error != nil || data == nil
                {
                    print("error")
                }
                else{
                    if let responseText = String.init(data: data!, encoding: .ascii){
                        let jsonData = responseText.data(using: .utf8)!
                        flagListSpaces = try! JSONDecoder().decode([FlagList].self, from: jsonData)
//                        print(flagListSpaces)
                        completionHandler(flagListSpaces)
                    }
                }
            })
            task.resume()
        }
        
        completionHandler(flagListSpaces)
        
    }
}
