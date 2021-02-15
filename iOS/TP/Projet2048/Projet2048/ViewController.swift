//
//  ViewController.swift
//  Projet2048
//
//  Created by Raphaël Peim on 15/02/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var cells: UICollectionView!
    
    let rowsNumber = 4
    let columnsNumber = 4
    var gameCells: [[GameCell?]]
    let spaceBetweenCells = 2
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder, rowsNumber: 4, columnsNumber: 4)
    }
    
    init?(coder aDecoder: NSCoder, rowsNumber: Int, columnsNumber: Int) {
        self.rowsNumber = rowsNumber
        self.columnsNumber = columnsNumber
        gameCells = [[]]
        gameCells = ([[GameCell?]](repeating: [], count: rowsNumber-1))
        
        for i in 1...rowsNumber {
            let line = [GameCell?](repeating: nil, count: columnsNumber)
            gameCells[i-1] = line
        }
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cells.delegate = self
        cells.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: CGFloat(spaceBetweenCells), bottom: 0, right: CGFloat(spaceBetweenCells))
        layout.minimumLineSpacing = CGFloat(spaceBetweenCells)
        cells.setCollectionViewLayout(layout, animated: false)
        for i in 0...3 {
            for j in 0...3 {
                gameCells[i][j] = cells.dequeueReusableCell(withReuseIdentifier: "cell2048", for:
                NSIndexPath(row: i, section: j) as IndexPath) as? GameCell
            }
        }
        cells.backgroundColor = UIColor.gray
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        gameCells[indexPath.section][indexPath.row]!.drawCell()
        return gameCells[indexPath.section][indexPath.row]!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowsNumber
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return columnsNumber
    }
}

