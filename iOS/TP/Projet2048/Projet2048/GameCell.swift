//
//  Cell.swift
//  Projet2048
//
//  Created by Raphaël Peim on 15/02/2021.
//

import UIKit

class GameCell: UICollectionViewCell {
    let cellValue = 0
    let hasMoved = false
    let text: UILabel! = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func drawCell() -> Void {
        
    }
}
