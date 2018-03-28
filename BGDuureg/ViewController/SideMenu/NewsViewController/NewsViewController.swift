//
//  NewsViewController.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 12/29/17.
//  Copyright © 2017 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,menuDelegate {
    func scrollToMenuIndex(menuIndex: Int) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false

        self.view.backgroundColor = .red
//        let titleDict: NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.black]
//        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [NSAttributedStringKey : Any] 
        self.title = "Нүүр"
      

        self.view.addSubview(officeTableView)
        setupMenuBar()
    }
    
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    fileprivate func setupMenuBar() {
        menuBar.delegate = self
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|-50-[v0(50)]", views: menuBar)
        menuBar.topAnchor.constraint(equalTo:topLayoutGuide.topAnchor).isActive = true
        //        navigationController?.hidesBarsOnSwipe = true
        
    }
    lazy var officeTableView: UITableView = {
        var table  = UITableView(frame: CGRect(x: 0, y:120, width: windowFrame.width, height: windowFrame.height-100), style: UITableViewStyle.plain)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor =  UIColor.white
//        self.refreshController = UIRefreshControl()
        //      self.refreshController.addTarget(self, action: #selector(NewsViewController.loadData), for:.valueChanged)
        //      table.addSubview(self.refreshController)
        table.register(NewTableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NewTableViewCell
//        cell.item = itemsArray[indexPath.row] as! ShopItem
//        cell.dateLabel.textColor = MAINCOLOR
//        print("itemsArray.count = \(itemsArray.count)")
        
        
        cell.titleLabel.text = "ХҮҮХДЭД ЭЭЛТЭЙ ХОРОО” АЯНЫГ ЭХЛҮҮЛЭХЭЭР БОЛЛОО"
        

        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailVC = ProductDetailViewController()
//        detailVC.shopItem = itemsArray[indexPath.row] as! ShopItem
//        //        detailVC.item = itemsArray.object(at: (indexPath as NSIndexPath).row) as! NewsItem
//        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
