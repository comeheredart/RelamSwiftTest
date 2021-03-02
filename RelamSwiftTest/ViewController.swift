//
//  ViewController.swift
//  RelamSwiftTest
//
//  Created by JEN Lee on 2021/03/02.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        
        let name = "이지원"
        let position = "Main"
        let age = 25
        
        let park = Player()
        park.name = name
        park.position = position
        park.age = age
        
        //Create
        do{
            try realm.write{
                realm.add(park)
                print("넣은거임")
            }
        } catch {
            print("Error Add \(error)")
        }
        
        //Update
        do{
            try realm.write{
                park.position = "CF"
            }
        } catch {
            print("Error Update \(error)")
        }
        
        //Delete
        do{
            try realm.write{
                realm.delete(realm.objects(Player.self).filter("name == %@", park.name))
            }
        } catch {
            print("Error Delete \(error)")
        }
        
        //Read
        var player: Results<Player>
        player = realm.objects(Player.self)
        for i in player {
            print(i)
        }

    }
    
    
    
    func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let documentsDirectory = paths[0]
            return documentsDirectory
    }


}

