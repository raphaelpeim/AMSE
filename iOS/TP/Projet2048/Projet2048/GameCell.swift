//
//  Cell.swift
//  Projet2048
//
//  Created by Raphaël Peim on 15/02/2021.
//

import UIKit

class GameCell: UICollectionViewCell {
    var value = 0
    var hasMoved = false
    var content: UILabel! = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func drawCell() {
        if content == nil {
            content = UILabel(frame: CGRect(x:0, y:0, width:self.bounds.size.width, height:self.bounds.size.height))
            content.numberOfLines = 1
            content.textAlignment = .center
            content.textColor = UIColor.white
        }
        
        switch value {
            case let x where x >= 2 && x <= 16:
                content.text = "\(x)"
                self.backgroundColor = UIColor.lightGray
            case let x where x >= 32 && x <= 256:
                content.text = "\(x)"
                self.backgroundColor = UIColor.yellow
            case let x where x >= 512 && x <= 2048:
                content.text = "\(x)"
                self.backgroundColor = UIColor.brown
            case let x where x > 2048:
                content.text = "\(x)"
                self.backgroundColor = UIColor.red
            default:
                content.text = ""
                self.backgroundColor = UIColor.darkGray
        }
        
        self.contentView.addSubview(content)
    }
}
