//
//  TableViewHeader.swift
//  TableViewAnimation
//
//  Created by Renan Benatti Dias on 19/12/19.
//  Copyright © 2019 Blue Stack. All rights reserved.
//

import UIKit

final class TableViewHeader: UIView {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleHeaderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headerImageView.image = #imageLiteral(resourceName: "disneylogo")
        headerImageView.contentMode = .scaleAspectFit
        
        titleHeaderLabel.text = "You page about Disney world!"
        
        backgroundColor = .white
    }
}

extension TableViewHeader {
    
    static func loadView() -> TableViewHeader {
        UINib(nibName: "TableViewHeader", bundle: nil).instantiate(withOwner: nil).first as! TableViewHeader
    }
}
