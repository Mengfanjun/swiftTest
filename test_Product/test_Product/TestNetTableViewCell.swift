//
//  TestNetTableViewCell.swift
//  test_Product
//
//  Created by 孟凡君 on 2020/12/15.
//

import UIKit

class TestNetTableViewCell: UITableViewCell {

    var del:UILabel!
    
    lazy var TitleLbl:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.font(kWidthScale(13))
        lbl.textColor = UIColor.hex("#343434")
        lbl.numberOfLines = 2;
        return lbl
    }()
    
    lazy var detailLabel:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.font(kWidthScale(13))
        lbl.textColor = UIColor.hex("#FC1E38")
        lbl.numberOfLines = 2;
        return lbl
    }()
    
    lazy var Line : UIView = {
        let line = UIView();
        line.backgroundColor = UIColor.hex("#E6E6E6")
        return line
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /**
        初始化方法
        */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            if !self.isEqual(nil){
                
                self.contentView.addSubview(TitleLbl)
                self.contentView.addSubview(detailLabel)
                self.contentView.addSubview(Line)
                
                TitleLbl.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(10)
                    make.centerY.equalToSuperview()
                    make.width.equalTo(100)
                }
                
                detailLabel.snp.makeConstraints { (make) in
                    make.left.equalTo(TitleLbl.snp_right).offset(5)
                    make.centerY.equalToSuperview()
                    make.right.equalToSuperview()
                }
                
                Line.snp.makeConstraints { (make) in
                    make.left.right.equalToSuperview().inset(10)
                    make.bottom.equalToSuperview()
                    make.height.equalTo(0.5)
                }
            }
                
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /**
    报错修复的  我也不知道是什么鬼
    */
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
