//
//  TyreCodesTableViewCell.swift
//  TyreCade
//
//  Created by Nana Aferi on 06/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import UIKit

class TyreCodesTableViewCell: UITableViewCell {
    
    var tyrecodeModel: TyreCodeModel? {
        didSet {
            guard let tyrecodeItem = tyrecodeModel else { return }
            
            if let code = tyrecodeItem.code {
                codeLabel.text = code
            }
        }
        
    }
     

    let codeLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 10, width: UIScreen.main.bounds.width - 40, height: 20))
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(codeLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
           
          self.addSubview(codeLabel)
          
      }
      
       override func prepareForReuse() {
      }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          // Configure the view for the selected state
      }
    
}

