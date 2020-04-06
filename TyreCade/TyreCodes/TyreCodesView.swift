//
//  TyreCodesView.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import UIKit

class TyreCodesView: UIViewController {

    var presenter: TyreCodesPresenterProtocol?
    
    let tyreCadeTableView =  UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = TCConstants.Titles.ListCodesTitle.rawValue
        
        setUpTableView()
        presenter?.viewDidLoad() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
    func setUpTableView() {

        self.registerXIBs()

        self.view.addSubview(self.tyreCadeTableView)

        self.tyreCadeTableView.translatesAutoresizingMaskIntoConstraints = false

        self.tyreCadeTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.tyreCadeTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.tyreCadeTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.tyreCadeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        self.tyreCadeTableView.delegate = self
        self.tyreCadeTableView.dataSource = self
        
        self.tyreCadeTableView.isHidden = true

   }
    
    func registerXIBs(){
        self.tyreCadeTableView.register(UINib(nibName: "TyreCodesTableViewCell", bundle: nil), forCellReuseIdentifier: TCConstants.CellIdentifiers.TyrecodeCell.rawValue)
    }

}

    // MARK: - Table view data source
extension TyreCodesView : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfTyreCodes() ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TCConstants.CellIdentifiers.TyrecodeCell.rawValue, for: indexPath) as! TyreCodesTableViewCell
            cell.tyrecodeModel = self.presenter?.tyreCodes?[indexPath.row] 
        return cell
    }
    

}

extension TyreCodesView: TyreCodesViewProtocol {
    
    func showTyreCodes(with tyreCodes: [TyreCodeModel]) {
        self.tyreCadeTableView.isHidden = false
        self.tyreCadeTableView.reloadData()
    }
    
    func showError() {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    
}
