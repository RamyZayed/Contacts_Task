//
//  InfoScreen.swift
//  ContactStuff
//
//  Created by Mobile Team on 27/02/2022.
//

import UIKit

class InfoScreen: UIViewController {

    var person : CC? = nil
    
    private var nameLabel = UILabel()
    private var pic = UIImageView()
    private var jobLabel = UILabel()
    private var phoneImage = UIImageView()
    private var smartphoneImage = UIImageView()
    private var mailImage = UIImageView()
    private var infoLabel = UILabel()
    private var DesignationLabel = UILabel()
    private var departmentLabel = UILabel()
    private var stationLabel = UILabel()
    private var companyLabel = UILabel()
    private var l1 = UILabel()
    private var l2 = UILabel()
    private var l3 = UILabel()
    private var l4 = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imageSetup()
        
        nameLabelSetup()
        
        joblabelSetup()
        
        smartphoneImageSetup()
        
        phoneImageSetup()
        
        mailImagesetUp()
        
        infolabelSetup()
        
        designationlabelSetup()
        
        departmentLabelSetup()
        
        stationlabelSetup()
        
        companylabelSetup()

    }

    func imageSetup(){
        view.addSubview(pic)
        pic.image = person?.image
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive          = true
        pic.topAnchor.constraint(equalTo: view.topAnchor,constant: 25).isActive     = true
        pic.heightAnchor.constraint(equalToConstant: 200).isActive                  = true
        pic.widthAnchor.constraint(equalTo: pic.heightAnchor).isActive              = true
        pic.clipsToBounds = true
        pic.layer.cornerRadius = 100
    }
    
    func nameLabelSetup(){
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: pic.bottomAnchor, constant: 30).isActive = true
        nameLabel.text = person?.Name
        nameLabel.font = .monospacedDigitSystemFont(ofSize: 25, weight: .bold)
        nameLabel.textColor = .gray
    }

    func joblabelSetup(){
        view.addSubview(jobLabel)
        jobLabel.translatesAutoresizingMaskIntoConstraints = false
        jobLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        jobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 25).isActive = true
        
        jobLabel.text = "\(person!.designation) at \(person!.company)"
        
        jobLabel.font = .systemFont(ofSize: 13, weight: .bold)
        
        jobLabel.textColor = .lightGray
    }

    func phoneImageSetup(){
        phoneImage.image = UIImage(systemName: "phone.fill")
        phoneImage.tintColor = .darkGray
        phoneImage.backgroundColor = UIColor(cgColor: CGColor(red: 243/255, green: 197/255, blue: 255/255, alpha: 1))
        //phoneImage.layer.borderWidth = 1
        phoneImage.layer.cornerRadius = 15
        phoneImage.contentMode = .center
        view.addSubview(phoneImage)
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        phoneImage.topAnchor.constraint(equalTo: jobLabel.bottomAnchor,constant: 25).isActive = true
        phoneImage.trailingAnchor.constraint(equalTo: smartphoneImage.leadingAnchor,constant: -40).isActive = true
        phoneImage.heightAnchor.constraint(equalTo: smartphoneImage.heightAnchor).isActive = true
        phoneImage.widthAnchor.constraint(equalTo: smartphoneImage.heightAnchor).isActive = true
        
    }
    
    func smartphoneImageSetup(){
        smartphoneImage.image = UIImage(systemName: "iphone.homebutton")
        smartphoneImage.tintColor = .darkGray
        smartphoneImage.backgroundColor = UIColor(cgColor: CGColor(red: 243/255, green: 197/255, blue: 255/255, alpha: 1))
        //smartphoneImage.layer.borderWidth = 1
        smartphoneImage.layer.cornerRadius = 15
        smartphoneImage.contentMode = .center
        view.addSubview(smartphoneImage)
        smartphoneImage.translatesAutoresizingMaskIntoConstraints = false
        smartphoneImage.topAnchor.constraint(equalTo: jobLabel.bottomAnchor,constant: 25).isActive = true
        smartphoneImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        smartphoneImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        smartphoneImage.widthAnchor.constraint(equalTo: smartphoneImage.heightAnchor).isActive = true
        
    }
    
    
    func mailImagesetUp(){
        mailImage.image = UIImage(systemName: "envelope.fill")
        mailImage.backgroundColor = UIColor(cgColor: CGColor(red: 243/255, green: 197/255, blue: 255/255, alpha: 1))
        mailImage.tintColor = .darkGray
       // mailImage.layer.borderWidth = 1
        mailImage.layer.cornerRadius = 15
        mailImage.contentMode = .center
        view.addSubview(mailImage)
        mailImage.translatesAutoresizingMaskIntoConstraints = false
        mailImage.topAnchor.constraint(equalTo: jobLabel.bottomAnchor,constant: 25).isActive = true
        mailImage.leadingAnchor.constraint(equalTo: smartphoneImage.trailingAnchor,constant: 40).isActive = true
        mailImage.heightAnchor.constraint(equalTo: phoneImage.heightAnchor).isActive = true
        mailImage.widthAnchor.constraint(equalTo: phoneImage.heightAnchor).isActive = true

    }

    func infolabelSetup(){
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel)
        infoLabel.text = "Basic Information"
        infoLabel.font = .systemFont(ofSize: 17.6, weight: .heavy)
        infoLabel.textColor = .darkGray
        
        infoLabel.topAnchor.constraint(equalTo: mailImage.bottomAnchor,constant: 25).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
    }
    
    func designationlabelSetup() {
        view.addSubview(DesignationLabel)
        DesignationLabel.setup1(first: "Designation")
        DesignationLabel.translatesAutoresizingMaskIntoConstraints = false
        DesignationLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 25).isActive = true
        DesignationLabel.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor,constant:10).isActive = true
        
        view.addSubview(l1)
        l1.translatesAutoresizingMaskIntoConstraints = false
        l1.setup2(first: person!.designation)
        l1.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30).isActive = true
        l1.topAnchor.constraint(equalTo: DesignationLabel.topAnchor).isActive = true
    }
    
    func departmentLabelSetup(){
        
        view.addSubview(departmentLabel)
        departmentLabel.setup1(first: "Department")
        departmentLabel.translatesAutoresizingMaskIntoConstraints = false
        departmentLabel.topAnchor.constraint(equalTo: DesignationLabel.bottomAnchor, constant: 25).isActive = true
        departmentLabel.leadingAnchor.constraint(equalTo: DesignationLabel.leadingAnchor).isActive = true
        
        view.addSubview(l2)
        l2.translatesAutoresizingMaskIntoConstraints = false
        l2.setup2(first: person!.department)
        l2.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30).isActive = true
        l2.topAnchor.constraint(equalTo: departmentLabel.topAnchor).isActive = true
    }
    
    func stationlabelSetup(){
        
        view.addSubview(stationLabel)
        stationLabel.setup1(first: "Station")
        stationLabel.translatesAutoresizingMaskIntoConstraints = false
        stationLabel.topAnchor.constraint(equalTo: departmentLabel.bottomAnchor, constant: 25).isActive = true
        stationLabel.leadingAnchor.constraint(equalTo: departmentLabel.leadingAnchor).isActive = true
        
        view.addSubview(l3)
        l3.translatesAutoresizingMaskIntoConstraints = false
        l3.setup2(first: person!.station)
        l3.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30).isActive = true
        l3.topAnchor.constraint(equalTo: stationLabel.topAnchor).isActive = true
    }
    
    func companylabelSetup(){
        view.addSubview(companyLabel)
        companyLabel.setup1(first: "Company")
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.topAnchor.constraint(equalTo: stationLabel.bottomAnchor, constant: 25).isActive = true
        companyLabel.leadingAnchor.constraint(equalTo: stationLabel.leadingAnchor).isActive = true
        
        view.addSubview(l4)
        l4.translatesAutoresizingMaskIntoConstraints = false
        l4.setup2(first: person!.company)
        l4.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30).isActive = true
        l4.topAnchor.constraint(equalTo: companyLabel.topAnchor).isActive = true
    }
 
}

extension UILabel{
    func setup1(first : String){
        self.text = first
        self.textColor = .gray
        self.font = .systemFont(ofSize: 15, weight: .bold)
        
    }
    
    func setup2(first : String){
        self.text = first
        self.textColor = .gray
        self.font = .systemFont(ofSize: 15, weight: .light)
        
    }
}
