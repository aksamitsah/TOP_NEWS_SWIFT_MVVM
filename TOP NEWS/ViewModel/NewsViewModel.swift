//
//  NewsViewModel.swift
//  TOP NEWS
//
//  Created by amit sah on 28/07/22.
//

import Foundation
import UIKit

class NewsViewModel{
    
    weak var vc: NewsViewController?
    var data: [NewsData] = []{
        didSet{
            vc?.tableViewReload()
        }
    }
    
    func apiRequetCall(_ sender: UIRefreshControl = UIRefreshControl()){
        
        if sender.tag != 1 {
            Indicator.sharedInstance.showIndicator()
        }
        
        BaseNetworkCall().getResponse(K.APIs.topHeadlines, params: [
            "sources":"techcrunch"
        ])
        { [self] result in
            DispatchQueue.main.async{
                if sender.tag != 1 {
                    Indicator.sharedInstance.hideIndicator()
                }
                else{
                    sender.endRefreshing()
                }
            }
            
            switch result {
            case .success(let datas):
                
                do{
                    let resp :NewsResponse = try JSONDecoder().decode(NewsResponse.self, from: datas)
                    
                    DispatchQueue.main.async {
                        
                        if resp.status ?? "" == "OK" && resp.totalResults ?? 0 < 1 {
                            self.vc?.displayMessage("No Result Found")
                            return
                        }
                        
                        if let rec = resp.articles, rec.count > 0{
                            self.data = rec
                            //self.data.append(contentsOf: rec)
                        }
                        
                    }
                }
                catch {
                    self.vc?.displayMessage("Json Response Error")
                }
                
            case .failure(let errorMsg):
                DispatchQueue.main.async {
                    self.vc?.displayMessage(errorMsg.localizedDescription)
                }
            }
        }
        
    }
    
    func webView(_ index: Int){
        
        guard let url = URL(string: data[index].url ?? "") else{
            vc?.displayMessage("Cant get URL")
            return
        }
        vc?.setupURL(url)
    }
}
