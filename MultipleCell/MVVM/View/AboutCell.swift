//
// Created by cihan bas on 30.10.2020.
//

import Foundation
import UIKit
import SnapKit

class AboutCell : UITableViewCell {
    var aboutLabel: UILabel = {
        var label = UILabel()
        label.text = "about"
        label.textColor = .green
        return label
    }()

    var item: ProfileViewModelItem? {
        didSet {
            guard  let item = item as? ProfileViewModelAbout else {
                return
            }

            aboutLabel.text = item.about
        }
    }
    static var identifier = "AboutCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(aboutLabel)
        aboutLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
        }
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
