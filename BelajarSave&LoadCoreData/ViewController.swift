//
//  ViewController.swift
//  BelajarSave&LoadCoreData
//
//  Created by Muhammad Rajab Priharsanto on 30/09/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController
{

    @IBOutlet weak var barangPertamaTextfield: UITextField!
    @IBOutlet weak var barangKeduaTextfield: UITextField!
    @IBOutlet weak var hargaBarangPertamaTextfield: UITextField!
    @IBOutlet weak var hargaBarangKeduaTextfield: UITextField!
    @IBOutlet weak var statusSaveLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func saveAll()
    {
        let barangPertama = barangPertamaTextfield.text
        let barangKedua = barangKeduaTextfield.text
        let hargaBarangPertama = Int(hargaBarangPertamaTextfield.text!)
        let hargaBarangKedua = Int(hargaBarangKeduaTextfield.text!)
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate
        else
        {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Barang", in: managedContext)!
        let barangKeCoreData = NSManagedObject(entity: entity, insertInto: managedContext)
        
        barangKeCoreData.setValue(barangPertama, forKey: "barangPertama")
        barangKeCoreData.setValue(barangKedua, forKey: "barangKedua")
        barangKeCoreData.setValue(hargaBarangPertama, forKey: "hargaBarangPertama")
        barangKeCoreData.setValue(hargaBarangKedua, forKey: "hargaBarangKedua")
        
        do {
            try managedContext.save()
            print("Core Data Masuk")
            statusSaveLabel.text = "Core Data Masuk"
        }
        catch let error as NSError
        {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton)
    {
        saveAll()
    }
    

}

