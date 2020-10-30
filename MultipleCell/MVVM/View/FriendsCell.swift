//
//  FriendsCell.swift
//  MultipleCell
//
//  Created by cihan bas on 30.10.2020.
//

import Foundation
import UIKit
import SnapKit

class FriendCell: UITableViewCell {
    var name: UILabel = {
        var label = UILabel()
        label.text = "email"
        label.textColor = .green
        return label
    }()
    var avatar : UIImageView = {
        var pictureImageView = UIImageView()
        pictureImageView.layer.cornerRadius = 40
        pictureImageView.clipsToBounds = true
        pictureImageView.contentMode = .scaleAspectFit
        pictureImageView.backgroundColor = UIColor.lightGray
        return pictureImageView
    }()
    var item: Friend? {
        didSet {
            guard let item = item else {
                return
            }
            
            if let pictureUrl = item.pictureUrl {
                avatar.image = UIImage(named: pictureUrl)
            }
            print("Picture URL", item.pictureUrl ?? "test")
            self.name.text = item.name
        }
    }
    
    static var identifier = "FriendCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        self.addSubview(avatar)
        self.addSubview(name)
        avatar.snp.makeConstraints { (make) in
            make.height.width.equalTo(80)
                make.centerY.equalToSuperview()
           
        }
 
        name.snp.makeConstraints { (make) in
            make.left.equalTo(avatar.snp.right)
                make.centerY.equalToSuperview()
           
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
