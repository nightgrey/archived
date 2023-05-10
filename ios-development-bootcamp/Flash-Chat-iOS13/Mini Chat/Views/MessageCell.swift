//
//  MessageCell.swift
//  Mini Chat
//
//  Created by Nico Niebergall on 04.08.20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var meAvatar: UIView!
    @IBOutlet weak var youAvatar: UIView!
    @IBOutlet weak var dateLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
        
        meAvatar.layer.cornerRadius = meAvatar.frame.size.width / 2
        youAvatar.layer.cornerRadius = youAvatar.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
