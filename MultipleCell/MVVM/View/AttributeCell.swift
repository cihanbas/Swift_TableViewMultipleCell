 
 import Foundation
 import UIKit
 import SnapKit
 
 class AttributeCell : UITableViewCell{
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "titleLabel"
        label.textColor = .green
        return label
    }()
    var valueLabel: UILabel = {
        var label = UILabel()
        label.text = "valueLabel"
        label.textColor = .green
        return label
    }()
    var item: Attribute?  {
        didSet {
            titleLabel.text = item?.key
            valueLabel.text = item?.value
        }
    }
    
    static var identifier = "EmailCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 }
