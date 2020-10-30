//
// Created by cihan bas on 30.10.2020.
//

import Foundation
import UIKit
import SnapKit

class EmailCell : UITableViewCell{
    var _email: UILabel = {
        var label = UILabel()
        label.text = "email"
        label.textColor = .green
        return label
    }()
    
    static var identifier = "EmailCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(_email)
        _email.snp.makeConstraints { (make) in
         
                make.centerY.equalToSuperview()
           
        }
        
    }

    var item: ProfileViewModelItem? {
        didSet {
            guard  let item = item as? ProfileVMEmail else {
                return
            }

            _email.text = item.email
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
