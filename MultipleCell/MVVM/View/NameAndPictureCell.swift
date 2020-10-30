//
// Created by cihan bas on 30.10.2020.
//

import Foundation
import UIKit

class NameAndPictureCell: UITableViewCell {
    var name: UILabel = {
        var label = UILabel()
        label.text = "Name"
        label.textColor = .green
        return label
    }()
    static var identifier = "NameAndPicture"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    var item: ProfileViewModelItem? {
        didSet {
            guard  let item = item as? ProfileVMNameAndPicture else {
                return
            }

            name.text = item.userName
        }
    } 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
