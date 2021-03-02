//
//  ViewController.swift
//  Project2048
//
//  Created by Raphaël Peim on 15/02/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var cells: UICollectionView!
    
    var rows: Int
    var columns: Int
    var gameCells: [[GameCell?]]
    let cellSpacing: Int = 10
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder, rows: 4, columns: 4)
    }
    
    init?(coder aDecoder: NSCoder, rows: Int, columns:Int) {
        self.rows = rows
        self.columns = columns
        self.gameCells = [[]]
        self.gameCells = ([[GameCell?]](repeating: [], count: rows))
        
        for i in 1...rows {
            let line = [GameCell?](repeating: nil, count: columns)
            gameCells[i-1] = line
        }
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cells.delegate = self
        cells.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: CGFloat(cellSpacing), bottom: 0, right: CGFloat(cellSpacing))
        layout.minimumLineSpacing = CGFloat(cellSpacing)
        cells.setCollectionViewLayout(layout, animated: false)
        
        for i in 0...3 {
            for j in 0...3 {
                gameCells[i][j] = cells.dequeueReusableCell(withReuseIdentifier: "cell2048", for: NSIndexPath(row: i, section: j) as IndexPath) as? GameCell
            }
        }
        
        cells.backgroundColor = UIColor.gray
        
//        let detectionMouvementR:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
//        detectionMouvementR.direction = .right
//        view.addGestureRecognizer(rightMovement)
//        
//        let detectionMouvementL:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
//        detectionMouvementL.direction = .left
//        view.addGestureRecognizer(leftMovement)
//        
//        let detectionMouvementH:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
//        detectionMouvementH.direction = .up
//        view.addGestureRecognizer(upMovement)
//        
//        let detectionMouvementB:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
//        detectionMouvementB.direction = .down
//        view.addGestureRecognizer(downMovement)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        gameCells[indexPath.section][indexPath.row]!.drawCell()
        return gameCells[indexPath.section][indexPath.row]!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rows
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return columns
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: CGFloat(cellSpacing))
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (cells.frame.width - CGFloat(cellSpacing * (columns+2))) / CGFloat(columns), height: (cells.frame.height - CGFloat(cellSpacing * (rows+2))) / CGFloat(columns))
    }
    
    @IBAction func play() {
        for i in 0...3 {
            for j in 0...3 {
                gameCells[i][j]!.value = Int(pow(2, Double(j+i*j)))
            }
        }
    }
    
    @objc func mouvement(sender:UISwipeGestureRecognizer){
        switch sender.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Right")
            case UISwipeGestureRecognizer.Direction.left:
                print("Left")
            case UISwipeGestureRecognizer.Direction.up:
                print("Up")
            case UISwipeGestureRecognizer.Direction.down:
                print("Down")
            default:
            break
        }
    }
}
