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
    var data: [NewsData] = []
    
    func apiRequetCall(){
        vc?.indicator.showIndicator()
        
        BaseNetworkCall().getResponse(K.APIs.topHeadlines, params: ["sources":"techcrunch"])
        { [self] result in

            DispatchQueue.main.async{
                self.vc?.indicator.hideIndicator()
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
                        
                        print(resp.articles)
                        guard let rec = resp.articles, rec.count > 0 else {
                            return
                        }
                        self.data = rec
                        //self.data.append(contentsOf: rec)
                        
                        DispatchQueue.main.async{
                            self.vc?.tableViewReload()
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
    
    static func openVC(parentVC: UIViewController){
        if let openViewController = K.StoryBoard.mainStoryBoard.instantiateViewController(withIdentifier: NewsModel.identifier) as? NewsViewController {
            openViewController.modalPresentationStyle = .fullScreen
            parentVC.present(openViewController, animated: true)
        }
    }
}
