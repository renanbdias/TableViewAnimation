//
//  PrincessTableViewCell.swift
//  TableViewAnimation
//
//  Created by Renan Benatti Dias on 19/12/19.
//  Copyright © 2019 Blue Stack. All rights reserved.
//

import UIKit

protocol PrincessTableViewCellProtocol {
    
    var avatar: UIImage? { get }
    var name: String { get }
    var subtitle: String { get }
}

final class PrincessTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .red
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    func populateWith(viewModel: PrincessTableViewCellProtocol) {
        avatarImageView.image = viewModel.avatar
        nameLabel.text = viewModel.name
        subtitleLabel.text = viewModel.subtitle
    }
}
