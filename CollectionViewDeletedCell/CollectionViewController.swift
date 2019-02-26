//
//  CollectionViewController.swift
//  CollectionViewDeletedCell
//
//  Created by Vũ on 2/26/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit
extension CollectionViewController: CollectionViewCellDelegate {
    func deleteCell(cell: CollectionViewCell) {
        if let indexPath = collectionView?.indexPath(for: cell) {
            images.remove(at: indexPath.item)
            collectionView?.reloadData()
        }
    }
    
    
}



class CollectionViewController: UICollectionViewController {
    var images = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        var layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: ((self.collectionView?.frame.width)! - 20)/3, height: ((self.collectionView?.frame.height)! - 20)/3)

       navigationItem.leftBarButtonItem = editButtonItem
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.delegate = self
        cell.imageCell.image = UIImage(named: images[indexPath.row])
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.5
        // Configure the cell
    
        return cell
    }
  override  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
    cell?.layer.borderColor = UIColor.darkGray.cgColor
    cell?.layer.borderWidth = 2
    
    // Display Image on ViewController
    let mainController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    mainController.images = UIImage(named: images[indexPath.row])!
    self.navigationController?.pushViewController(mainController, animated: true)
    
    
    }
  override  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath)
    cell?.layer.borderColor = UIColor.gray.cgColor
    cell?.layer.borderWidth = 0.5
    }
    
    // Mark: Delete Items
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        addBarButtonItem.isEnabled = !editing
        if let indexPaths = collectionView?.indexPathsForVisibleItems {
            for indexPath in indexPaths {
                if let cell = collectionView?.cellForItem(at: indexPath) as? CollectionViewCell {
                    cell.isEditing = editing
                }
            }
        }
    }

   // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
