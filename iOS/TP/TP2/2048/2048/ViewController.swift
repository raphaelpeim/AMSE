//
//  ViewController.swift
//  2048
//
//  Created by Raphaël Peim on 15/02/2021.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    let espacementCellules = 10;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let detectionMouvementR:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
        detectionMouvementR.direction = .right
        view.addGestureRecognizer(detectionMouvementR)
        let detectionMouvementL:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
        detectionMouvementL.direction = .left
        view.addGestureRecognizer(detectionMouvementL)
        let detectionMouvementH:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
        detectionMouvementH.direction = .up
        view.addGestureRecognizer(detectionMouvementH)
        let detectionMouvementB:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.mouvement))
        detectionMouvementB.direction = .down
        view.addGestureRecognizer(detectionMouvementB)
        cells.delegate=self
        cells.dataSource=self
        let layout:UICollectionViewFlowLayout=UICollectionViewFlowLayout()
        layout.sectionInset=UIEdgeInsets(top: 0, left: CGFloat(espacementCellules),bottom: 0, right: CGFloat(espacementCellules))
        layout.minimumLineSpacing=CGFloat(espacementCellules)
        cells.setCollectionViewLayout(layout,animated:false)
        for i in 0...3{
            for j in 0...3{
                cellules[i][j]=cells.dequeueReusableCell(withReuseIdentifier:"cell2048", for:NSIndexPath(row:i, section:j)as IndexPath) as? celluleCollectionViewCell
            }
        }
        
        cells.backgroundColor=UIColor.yellow// Do any additional setup after loading the view, typically from a nib.
        bestscore.text = String(0);
        maConfig.string(forKey: bestscore!.text!);
    }
    
    @IBOutlet weak var cells: UICollectionView!;
    @IBOutlet weak var button:UIButton!;
    @IBOutlet weak var score: UILabel!;
    @IBOutlet weak var bestscore: UILabel!;
    
    let maConfig = UserDefaults.standard;
    
    var nbcolonne: Int;
    var nbligne: Int;
    var cellules: [[celluleCollectionViewCell?]]
    
    required convenience init?(coder aDecoder: NSCoder){
        self.init(coder: aDecoder, nbligne: 4, nbcolonne: 4)
        
    }
    
    init?(coder aDecoder: NSCoder, nbligne: Int, nbcolonne: Int){
        self.nbligne = nbligne;
        self.nbcolonne = nbcolonne;
        cellules = [[]]
        cellules = ([[celluleCollectionViewCell?]](repeating: [], count: nbligne))
        for j in 1...nbligne{
            let ligne = [celluleCollectionViewCell?](repeating: nil, count: nbcolonne)
            cellules[j-1] = ligne
        }
        super.init(coder: aDecoder)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell{
        cellules[indexPath.section][indexPath.row]!.dessineCellule()
        return cellules[indexPath.section][indexPath.row]!
    }
    
    func collectionView(_ _collectionView:UICollectionView,numberOfItemsInSection section:Int)->Int{
        return nbligne
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return nbcolonne
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:0, height:CGFloat(espacementCellules))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (cells.frame.width - CGFloat(espacementCellules*(nbcolonne+2))) / CGFloat(nbcolonne), height: (cells.frame.height - CGFloat(espacementCellules*(nbligne+2))) / CGFloat(nbcolonne))
    }
    
   
    @IBAction func jouer(sender: UIButton) {
        score.text = String(0);
       
        for i in 0...3{
            for j in 0...3{
                cellules[i][j]!.valeur=0}}
        let c1 : Int = Int.random(in:0...3)
        let l1 : Int = Int.random(in:0...3)
        let c2 : Int = Int.random(in:0...3)
        let l2 : Int = Int.random(in:0...3)
        let nb1 : Int = Int.random(in:0...1)
        let nb2 : Int = Int.random(in:0...1)
        if nb1==0{
        cellules[c1][l1]!.valeur=2
        }
        if nb1==1{
            cellules[c1][l1]!.valeur=4
        }
        if nb2==0{
            cellules[c2][l2]!.valeur=2
        }
        if nb2==1{
            cellules[c2][l2]!.valeur=4
        }
        
        
    }
    
    func afficheLigne(i: Int) {
        for j in 0...3 {
            print("\(cellules[i][j]!.valeur)\t")
        }
        print("\n")
    }
    @objc func mouvement(sender:UISwipeGestureRecognizer){
        switch sender.direction {
    case UISwipeGestureRecognizer.Direction.right:
        print("Droite")
        
        for n in 0...3{
            for m in 0...2{
                var l:Int=0
                while cellules[n][3-m]!.valeur==0 && l<3-m {
                    for k in 0...3-m-1{
                        cellules[n][3-m-k]!.valeur = cellules[n][3-m-k-1]!.valeur
                        cellules[n][3-m-k-1]!.valeur = 0
                    }
                    l=l+1
                }
                
            }
        }
     

        for i in 0...3{
            print("Ligne : \(i)")
            for j in 0...2{
                afficheLigne(i:i)
               
                if cellules[i][3-j]!.valeur == cellules[i][3-j-1]!.valeur {
                    cellules[i][3-j]!.valeur = cellules[i][3-j]!.valeur * 2
                    score.text = String(Int(score!.text!)! + cellules[i][3-j]!.valeur)
                    if Int(score!.text!)!>Int(bestscore!.text!)!{
                        bestscore.text=score.text
                        maConfig.set(bestscore.text, forKey: "bestscore")
                        
                    }
                    if j==2{
                        cellules[i][0]!.valeur=0
                        
                    }
                    else{
                    for k in 1...3-j-1{
                        cellules[i][3-j-k]!.valeur=cellules[i][3-j-k-1]!.valeur
                    }
                        cellules[i][0]!.valeur=0;}}
            }
            }
        if vide(){
            aleatoire()
        }
            stop()
        
       
    case UISwipeGestureRecognizer.Direction.left:
        print("Gauche")
        for n in 0...3{
            for m in 0...2{
                var l:Int=0
                while cellules[n][m]!.valeur==0 && l<3-m {
                    for k in m...2{
                        cellules[n][k]!.valeur = cellules[n][k+1]!.valeur
                        cellules[n][k+1]!.valeur = 0
                    }
                    l=l+1
                }
                
            }
        }
        
        for i in 0...3{
            print("Ligne : \(i)")
            for j in 0...2{
                afficheLigne(i:i)
                
                if cellules[i][j]!.valeur == cellules[i][j+1]!.valeur {
                    cellules[i][j]!.valeur = cellules[i][j+1]!.valeur * 2
                    score.text = String(Int(score!.text!)! + cellules[i][j]!.valeur)
                    if Int(score!.text!)!>Int(bestscore!.text!)!{
                        bestscore.text=score.text
                        maConfig.set(bestscore.text, forKey: "bestscore")
                    }
                    if j==2{
                        cellules[i][j]!.valeur=0
                        
                    }
                    else{
                        for k in j+1...2 {
                            cellules[i][k]!.valeur=cellules[i][k+1]!.valeur
                        }
                        cellules[i][2]!.valeur=0;}}
                
                
            }
            
            }
        if vide(){
            aleatoire()
        }
            stop()
        
    case UISwipeGestureRecognizer.Direction.up:
        print("Haut")
        for n in 0...3{
            for m in 0...2{
                var l:Int=0
                while cellules[m][n]!.valeur==0 && l<3-m {
                    for k in m...2{
                        cellules[k][n]!.valeur = cellules[k+1][n]!.valeur
                        cellules[k+1][n]!.valeur = 0
                    }
                    l=l+1
                }
                
            }
        }
        
        for i in 0...3{
            print("Ligne : \(i)")
            for j in 0...2{
                afficheLigne(i:i)
                
                if cellules[j][i]!.valeur == cellules[j+1][i]!.valeur {
                    cellules[j][i]!.valeur = cellules[j+1][i]!.valeur * 2
                    score.text = String(Int(score!.text!)! + cellules[j][i]!.valeur)
                    if Int(score!.text!)!>Int(bestscore!.text!)!{
                        bestscore.text=score.text
                        maConfig.set(bestscore.text, forKey: "bestscore")
                    }
                    if j==2{
                        cellules[j][i]!.valeur=0
                        
                    }
                    else{
                        for k in j+1...2 {
                            cellules[k][i]!.valeur=cellules[k+1][i]!.valeur
                        }
                        cellules[2][i]!.valeur=0;}}
                
                
            }
            }
        if vide(){
            aleatoire()
        }
            stop()
            
            
    case UISwipeGestureRecognizer.Direction.down:
        print("Bas")
        for n in 0...3{
            for m in 0...2{
                var l:Int=0
                while cellules[3-m][n]!.valeur==0 && l<3-m {
                    for k in 0...3-m-1{
                        cellules[3-m-k][n]!.valeur = cellules[3-m-k-1][n]!.valeur
                        cellules[3-m-k-1][n]!.valeur = 0
                    }
                    l=l+1
                }
                
            }
        }
        
        for i in 0...3{
            print("Ligne : \(i)")
            for j in 0...2{
                afficheLigne(i:i)
                
                if cellules[3-j][i]!.valeur == cellules[3-j-1][i]!.valeur {
                    cellules[3-j][i]!.valeur = cellules[3-j][i]!.valeur * 2
                    score.text = String(Int(score!.text!)! + cellules[3-j][i]!.valeur)
                    if Int(score!.text!)!>Int(bestscore!.text!)!{
                        bestscore.text=score.text
                        maConfig.set(bestscore.text, forKey: "bestscore")
                    }
                    if j==2{
                        cellules[0][i]!.valeur=0
                        
                    }
                    else{
                        for k in 1...3-j-1{
                            cellules[3-j-k][i]!.valeur=cellules[3-j-k-1][i]!.valeur
                        }
                        cellules[0][i]!.valeur=0;}}
                
                
            }
         
            }
        if vide(){
             aleatoire()
        }
        
               stop()
            
        default:
            break
        }
    

}
    
    func aleatoire(){
        var i : Int = Int.random(in:0...3)
        var j : Int = Int.random(in:0...3)
        while cellules[i][j]!.valeur != 0 {
            i = Int.random(in:0...3)
            j = Int.random(in:0...3)
        }
        
        let nb1 : Int = Int.random(in:0...1)
        if nb1==0{
            cellules[i][j]!.valeur=2
        }
        if nb1==1{
            cellules[i][j]!.valeur=4
        }
       
    }
    func stop(){
        var p: Int = 0;
        for i in 0...3{
            for j in 0...3{
                if cellules[i][j]!.valeur != 0{
                    p=p+1
                }
            }
        }
        if p==16 {
            var x=0;
            for n in 0...2{
                if cellules[n][3]==cellules[n+1][3]{
                    x=x+1;
                }
            }
            for m in 0...2{
                if cellules[3][m]==cellules[3][m+1]{
                    x=x+1;
                }
            }
            for i in 0...2{
                for j in 0...2{
                    if cellules[i][j]!.valeur == cellules[i][j+1]!.valeur || cellules[i][j]!.valeur == cellules[i+1][j]!.valeur {
                        x=x+1;
                    }
                }
            }
    
            if x==0{
                let alert = UIAlertController(title: "GAME OVER", message: "Mais c'est pas grave on t'aime quand même", preferredStyle : UIAlertController.Style.alert)
                let rejouer = UIAlertAction(title: "rejouer", style: UIAlertAction.Style.default){(okSlected) -> Void in self.jouer(sender: self.button)}
                alert.addAction(rejouer)
                self.present(alert, animated: true, completion: nil)
                
                    }
                }
            }
    
    func vide()->Bool{
        var p: Int = 0;
        for i in 0...3{
            for j in 0...3{
                if cellules[i][j]!.valeur != 0{
                    p=p+1
                }
            }
        }
        if p != 16{
            return true;
        }
        else {
            return false;
        }
    }
    
}



