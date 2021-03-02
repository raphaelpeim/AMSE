//
//  celluleCollectionViewCell.swift
//  2048
//
//  Created by Raphaël Peim on 15/02/2021.
//

import UIKit

class celluleCollectionViewCell: UICollectionViewCell {
    var valeur: Int = 0 {
        didSet{
            dessineCellule()
        }
    }
    var mouv : Bool = false;
    var texte: UILabel!=nil;
    
    override init(frame: CGRect){
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func dessineCellule() {
        if texte == nil {
            texte = UILabel(frame: CGRect(x:0, y:0, width:self.bounds.size.width, height:self.bounds.size.height));  texte.numberOfLines = 1
            texte.textAlignment = .center
            texte.textColor = UIColor.black
        }
        switch valeur {
        case let x where x >= 2 && x <= 16:
            texte.text = "\(x)"
            self.backgroundColor = UIColor.blue
        case let x where x >= 32 && x <= 256:
                texte.text = "\(x)"
                self.backgroundColor = UIColor.green
        case let x where x >= 512 && x <= 2048:
                    texte.text = "\(x)"
                    self.backgroundColor = UIColor.brown
        case let x where x > 2048:
                        texte.text = "\(x)"
                        self.backgroundColor = UIColor.red
        default:
                            texte.text = ""
                            self.backgroundColor = UIColor.purple }
        self.contentView.addSubview(texte)   }
}
