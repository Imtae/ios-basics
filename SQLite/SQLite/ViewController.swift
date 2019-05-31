import UIKit
import SQLite3

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let hero:Hero = heroList[indexPath.row]
        cell.textLabel?.text = "\(String(describing: hero.name))"
        return cell
    }
    
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfRank: UITextField!
    @IBOutlet var tvHeros: UITableView!
    
    var heroList = [Hero]()
    
    let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("testDB.sqlite")
    
//    let dbFileName = "db.sqlite"
//    let rDBPath = Bundle.main.path(forResource: db, ofType: "sqlite")

    var db:OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (sqlite3_open(fileUrl.path, &db) != SQLITE_OK) {
//        if (sqlite3_open(rDBPath, &db) != SQLITE_OK) {
            print("Error opening database")
        } else {
//            print("DB path: " + fileUrl.path)
//            print("DB path: \(rDBPath)")
            print("DB path: \(fileUrl.path)")
        }
        readValues()
    }
    
    func readValues() {
        heroList.removeAll()
        let queryString = "Select * from Heroes"
        var stmt: OpaquePointer?
        
        if (sqlite3_prepare(db, queryString, -1, &stmt, nil) == SQLITE_OK) {
            while (sqlite3_step(stmt) == SQLITE_ROW) {
                let id = sqlite3_column_int(stmt, 0)
                let name = String(cString: sqlite3_column_text(stmt, 1))
                let powerrank = sqlite3_column_int(stmt, 2)
                
                heroList.append(Hero(id: Int(id), name: String(describing: name), powerRanking: Int(powerrank)))
            }
        } else {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            
            print("Error preparing select: \(errmsg)")
            return
        }
        tvHeros.reloadData()
    }

    @IBAction func btnCreate(_ sender: UIButton) {
        if (sqlite3_exec(db, "Create table if not exists Heroes (id Integer primary key autoincrement, name Text, powerrank Integer)", nil, nil, nil) != SQLITE_OK) {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            
            print("Error creating table: \(errmsg)")
        } else {
            print("Create table OK!")
        }
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        let name = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let rank = tfRank.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (name?.isEmpty)! {
            tfName.layer.borderColor = UIColor.red.cgColor
            tfName.layer.borderWidth = 1
            return
        }
        if (rank?.isEmpty)! {
            tfRank.layer.borderColor = UIColor.red.cgColor
            tfRank.layer.borderWidth = 1
            return
        }
        
        var stmt:OpaquePointer?
        
        let queryString = "Insert into Heroes(name, powerrank) values(?,?)"
        
        if (sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK) {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            
            print("Error preparing insert: \(errmsg)")
            return
        }
        
        if (sqlite3_bind_text(stmt, 1, name, -1, nil) != SQLITE_OK) {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            
            print("Failure binding name: \(errmsg)")
            return
        }
        
        if (sqlite3_bind_int(stmt, 2, (rank! as NSString).intValue) != SQLITE_OK) {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            
            print("Failure binding powerrank: \(errmsg)")
            return
        }
        
        if (sqlite3_step(stmt) != SQLITE_DONE) {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            
            print("Failure inserting data: \(errmsg)")
            return
        }
        
        tfName.text = ""
        tfRank.text = ""
        tfName.becomeFirstResponder()
        print("Data save successfully")
        readValues()
    }
    
    
    
}

