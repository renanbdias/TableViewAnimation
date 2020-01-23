//
//  Princess.swift
//  TableViewAnimation
//
//  Created by Renan Benatti Dias on 19/12/19.
//  Copyright © 2019 Blue Stack. All rights reserved.
//

import UIKit

struct Princess {
    
    let avatarName = "person.fill"
    let name: String
    let subtitle: String
}

extension Princess: PrincessTableViewCellProtocol {
    
    var avatar: UIImage? {
        UIImage(named: avatarName)
    }
}
