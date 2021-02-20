//
//  ViewController.swift
//  task
//
//  Created by vinay bhardwaj on 16/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    var userData  = ["first name":"","last name":"","Date of birth":"","gender":"","country":"","State":"","Home Town":"","Phone Number":""]
    
    @IBOutlet weak var imageView: UITableView!
   var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var addUserButton: UIButton!
    
    @IBAction func addUserBtnTapped(_ sender: UIButton) {
        for (key,value) in userData{
            if  value.count == 0{
              let controller = UIAlertController(title: "Error", message: "Please enter \(key)", preferredStyle: .alert)
                controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(controller, animated: true, completion: nil)
                return
                
            }
        }
        names.append(userData)
        userData  = ["first name":"","last name":"","Date of birth":"","gender":"","country":"","State":"","Home Town":"","Phone Number":""]
        
        for  cell in tableView.visibleCells{
            if let cell =  cell as? FormTableViewCell{
                cell.formTextFiled?.text = ""
            }
        }
        addUserButton.isHidden = true
        isUsersTabSelected = true
        tableView.reloadData()    }
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: String(describing: AddImageHeaderView.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: AddImageHeaderView.self))
            imagePicker.delegate = self        }
    }
    //weak var tblview: UITableView!
    var names = [[String:String]]()
    var isUsersTabSelected = true
    var formPlaceHolderDataArray = ["first name","last name","Date of birth","gender","country","State","Home Town","Phone Number"]
    //var names = ["String","vahdv"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func userTabSelected(_ sender:UIButton){
        isUsersTabSelected = true
        tableView.reloadData()
        addUserButton.isHidden = true
    }
    @IBAction func enrollTabSelected(_ sender:UIButton){
        isUsersTabSelected = false
        tableView.reloadData()
        addUserButton.isHidden = false
    }
    
    @IBAction func imageButton(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker,animated: true,completion: nil)
    
    }
    
}
extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.editedImage.rawValue)]as? UIImage {
            if let headerView  = tableView.headerView(forSection: 0) as? AddImageHeaderView{
                headerView.imgView.image = image
                
            }
            picker.dismiss(animated: true, completion: nil)
            print(image)
            
        }
    }
//     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let image = info[UIImagePickerController.InfoKey.editedImage.rawValue]as? UIImage {
//
//        }
//    dismiss(animated: true, completion: nil)
//    }
    }

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isUsersTabSelected == true{
            return names.count
        }
        return formPlaceHolderDataArray.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: AddImageHeaderView.self)) as! AddImageHeaderView
        header.delegate = self
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if isUsersTabSelected == true{
            return 0
        }
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isUsersTabSelected == true{
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserTableViewCell
            if let firstName = names[indexPath.row]["first name"],let  lastName = names[indexPath.row]["last name"]{
                cell.userNameLabel.text = firstName + " " + lastName
            }
            if let gender = names[indexPath.row]["gender"],let age = names[indexPath.row]["Date of birth"],let  country = names[indexPath.row]["country"]{
                cell.secondaryLabel.text = gender + " | " + age + " | " + country
                
            }
            cell.delegate = self
            cell.cellIndex = indexPath
            return cell
        } else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FormCell") as! FormTableViewCell
            cell.delegate  = self
            cell.userKey = formPlaceHolderDataArray[indexPath.row]
            cell.formTextFiled.placeholder  = formPlaceHolderDataArray[indexPath.row]
            return  cell
            
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100.0
//    }
    
    
}

extension ViewController : tblCellProtocol{
    
    func delete(index: IndexPath) {
        print("delete tapped",index)
    }
    
    
}

extension ViewController : UserDeletionProtocol {
    func cellDeletedAtIndexPath(indexPath:IndexPath){
        names.remove(at: indexPath.row )
        tableView.reloadData()
    }
}
extension ViewController :UserInfoProtocol {
    func userInfoEditedFor(key:String,value:String){
        userData[key] = value
    }
}

extension ViewController :AddImageProtocol {
    func addImageBtnTapped(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker,animated: true,completion: nil)
    }
}
