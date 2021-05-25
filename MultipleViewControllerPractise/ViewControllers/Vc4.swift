//
//  Vc4.swift
//  MultipleViewControllerPractise
//
//  Created by surya-zstk231 on 24/05/21.
//


import UIKit


struct Objects {
    let type: String
    let elements: [String]
}


class Vc4: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var contentElements = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CloneTableViewCell", bundle: nil), forCellReuseIdentifier: "cellIdentifier")
        
        let firstContent = Objects(type: " ", elements: ["General","Accesibility","Privacy"])
        let secondContent = Objects(type: " ", elements: ["Passwords"])
        let thirdContent = Objects(type: " ", elements: ["Safari","News","Maps","Shortcuts","Health","Siri & Search","Photos","Game Center"])
        let fourthContent = Objects(type: " ", elements: ["Developer"])
        
        contentElements.append(firstContent)
        contentElements.append(secondContent)
        contentElements.append(thirdContent)
        contentElements.append(fourthContent)
        
        
        tableView.dataSource = self
        tableView.delegate = self
    }
 

}

extension Vc4: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contentElements[section].elements.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! CloneTableViewCell
        cell.labelArea.text = contentElements[indexPath.section].elements[indexPath.row]
        cell.imageArea.image = UIImage(named: contentElements[indexPath.section].elements[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contentElements.count
    }
    
    
    //MARK:- Header allignments
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contentElements[section].type
    }
    
    //MARK:- Footer allignments
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
}

