//
//  MainVc.swift
//  MultipleViewControllerPractise
//
//  Created by surya-zstk231 on 24/05/21.
//

import UIKit

class MainVc: UIViewController {
//    let viewArr = ["Vc1","Vc2","Vc3"]
//    let modelView = UIView()
//    let modelView2 = UIView()
//    let modelView3 = UIView()
    
//    let viewController1:UIViewController = Vc1()
//    let viewController2:UIViewController = Vc2()
//    let viewController3:UIViewController = Vc3()
//    let viewController4:UIViewController = Vc4()
//    let viewController5:UIViewController = Vc5()
    
    let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    var arrOfVc:[UIViewController] = []
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let view1 = (storyboard?.instantiateViewController(identifier: "One"))!
        let view2 = (storyboard?.instantiateViewController(identifier: "Two"))!
        let view3 = (storyboard?.instantiateViewController(identifier: "Three"))!
        let view4 = (storyboard?.instantiateViewController(identifier: "Four"))!
        let view5 = (storyboard?.instantiateViewController(identifier: "Five"))!
        arrOfVc.append(view1)
        arrOfVc.append(view2)
        arrOfVc.append(view3)
        arrOfVc.append(view4)
        arrOfVc.append(view5)
       
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellID")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension MainVc: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfVc.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! CollectionViewCell
        cell.addSubview(arrOfVc[indexPath.row].view)
        return cell
    }
    
}

extension MainVc: UICollectionViewDelegate{
    
}
extension MainVc: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
