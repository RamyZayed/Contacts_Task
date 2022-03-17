//
//  ViewController.swift
//  ContactStuff
//
//  Created by Mobile Team on 27/02/2022.
//

import UIKit
import Contacts

struct CC {
    var Name : String
    var phoneNUmber : CNPhoneNumber
    var image : UIImage?
    var designation : String
    var department : String
    var station : String
    var company : String
}


class ViewController: UIViewController {
    let titles : [String] = [
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "G",
        "H",
        "I",
        "J",
        "K",
        "L",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "X",
        "Y",
        "Z"
    ]
    
    var profiles : [CC] = []
    
    var filtered : [CC] = []
    var d2array : [[CC]] = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    []
    ]
    let mytable  = UITableView()
    

    let searchText = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchingContacts()
        profiles = profiles.sorted { c1, c2 in
            c1.Name < c2.Name
        }
        setupSearch()
        mytable.dataSource = self
        mytable.delegate = self
        searchText.delegate  = self
        mytable.register( myCell.self , forCellReuseIdentifier: "Cell")
        mytable.sectionHeaderTopPadding = 0
    
        view.addSubview(mytable)
        mytable.translatesAutoresizingMaskIntoConstraints  = false
        mytable.sectionIndexColor = .gray
        mytable.separatorColor = .clear
        mytable.topAnchor.constraint(equalTo: searchText.bottomAnchor,constant: 10).isActive = true
        mytable.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -25).isActive = true
        mytable.leadingAnchor.constraint(equalTo: searchText.leadingAnchor).isActive = true
        mytable.trailingAnchor.constraint(equalTo: searchText.trailingAnchor,constant: -5).isActive = true
    }
    
    func setupSearch() {
        searchText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchText)
        searchText.topAnchor.constraint(equalTo: view.topAnchor,constant: 60).isActive = true
        searchText.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 25).isActive = true
        searchText.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -2).isActive = true
        searchText.placeholder = "Search Contacts"
        let im = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        im.tintColor  = .gray
        searchText.rightViewMode = .always
        searchText.rightView = im
    }
    
    func fetchingContacts () {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, err in
            if let err = err{
                print("failed to request access",err)
                return
            }
            if granted{
                print("Access Granted ")
                
                
                
                
                let keys = [CNContactGivenNameKey,          //name
                            CNContactFamilyNameKey,
                            CNContactPhoneNumbersKey,       //phonenumber
                            CNContactImageDataKey,          //image
                            CNContactOrganizationNameKey,   //company
                            CNContactDepartmentNameKey,     //department
                            CNContactJobTitleKey,           //job title
                           // CNContactkey
                                
                ]  // what you want to access
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                
                do {
                    try store.enumerateContacts(with: request) { contact, stopPointer in
                        var imm : UIImage? = nil
                        if let data = contact.imageData{
                            imm = UIImage(data: data)!
                        }

                        let name = "\(contact.givenName) \(contact.familyName)"
                        let phoneNumber = contact.phoneNumbers
                        let designation  = contact.jobTitle
                        let department = contact.departmentName
                        let station = "USA"
                        let company = contact.organizationName
                        let profile = CC(Name: name,
                                         phoneNUmber: phoneNumber.first?.value ?? CNPhoneNumber(stringValue: "1234"),
                                         image: imm,
                                         designation: designation,
                                         department: department,
                                         station: station,
                                         company: company)
                        self.profiles.append(profile)
                        let s : Character = Character(Array(name)[0].uppercased())
                        var asc : Int = Int(s.asciiValue!)
                        asc = asc - 65
                        self.d2array[asc].append(profile)
                    }
                }catch _ {
                    print("Failed")
                }
            }else {
                print("Access denied")
            }
            
        }
        
    }
    
}

extension ViewController : UITableViewDataSource{

    
    
    
    func filterText(){
        filtered.removeAll()
        if searchText.text == ""{
            return
        }
        var query = searchText.text!
        for k in d2array{
            for element in k {
                if element.Name.uppercased().starts(with : query.uppercased()){
                    filtered.append(element)
                }
            }
        }
        
//        print("-----------------------")
//        for z in filtered{
//            print(z.Name)
//            print(z.designation)
//        }
//        print("-----------------------")
    }
    
    //the section divider
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if searchText.text != ""{
            let l = UILabel()
            l.text = String(Array(searchText.text!)[0])
            return l
        }
        if d2array[section].count == 0 {
            return nil
        }
        let label = UILabel()
        let u = UnicodeScalar(section + 65)
        let char = Character(u!)
        label.text = String(char)
        label.textColor  = .gray
        return label
    }
    
    //number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if searchText.text != ""{
//            print("EMPTY")
            return 1
        }
        return d2array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchText.text != ""{
            return filtered.count
        }
        if d2array[section].count == 0{
            return 0
        }
        return d2array[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if d2array[section].count == 0 {
            return 0
        }
        return 20
    }

    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if d2array[section].count == 0{
            return 0
        }
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytable.dequeueReusableCell(withIdentifier: "Cell" , for : indexPath) as! myCell
//        let element = profiles[indexPath.row]
        
        var element : CC
        if !filtered.isEmpty{
            element = filtered[indexPath.row]
        }else {
             element = d2array[indexPath.section][indexPath.row]
        }
        

        cell.set(c: element)
        
        
        return cell
    }
    
    
}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mytable.deselectRow(at: indexPath, animated: true)
        let s2 = InfoScreen()
        if searchText.text != ""{
            s2.person = filtered[indexPath.row]
            
        }else{
            s2.person = d2array[indexPath.section][indexPath.row]
        }
//        s2.person = profiles[indexPath.row]
        s2.modalPresentationStyle = .formSheet
        present(s2, animated: true, completion: nil)

        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if !filtered.isEmpty{
            return []
        }
        return titles
    }
    
    
    // where each title index should lead you to
//    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//        if title == "A"{
//                return 24
//        }
//        return 0
//    }

}


extension ViewController : UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        filterText()
        mytable.reloadData()
    }
}
