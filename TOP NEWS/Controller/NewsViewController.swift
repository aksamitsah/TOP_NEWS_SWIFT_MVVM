//
//  NewsViewController.swift
//  TOP NEWS
//
//  Created by amit sah on 28/07/22.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController {

    var viewModel = NewsViewModel()
    let indicator = Indicator()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.apiRequetCall()
        
        viewModel.vc = self
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UINib(nibName: TopNewsTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: TopNewsTableViewCell.reuseIdentifier)
        
    }
    
    func displayMessage(_ body: String){
        DispatchQueue.main.async {
            Utils.displayAlert(v: self,body)
        }
    }

}
extension NewsViewController: SFSafariViewControllerDelegate{
    
    func setupURL(_ url : URL){
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("index selectde: ",indexPath.row)
        
        guard let url = URL(string: "https://www.google.com") else{
            print("error")
            return
        }
        setupURL(url)

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20//viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TopNewsTableViewCell.reuseIdentifier, for: indexPath) as! TopNewsTableViewCell
      
        //cell.setupData(resp: viewModel.data[indexPath.row])
        return cell
    }
    
    //Animation Show
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.2, delay: 0.0, animations: {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    func tableViewReload(){
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
}



