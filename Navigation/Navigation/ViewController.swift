import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    var isOn = false
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOff
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        textField.text = message
    }
    
    func didSwitchChangeDone(_ controller: EditViewController, isOn: Bool) {
        if (isOn) {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ctrl = segue.destination as!EditViewController
        
        if (segue.identifier == "editButton") {
            ctrl.textWayValue = "segue: use button"
        } else if (segue.identifier == "editBarButton") {
            ctrl.textWayValue = "segue: use bar button"
        }
        ctrl.textMessage = textField.text!
        ctrl.isOn = isOn
        ctrl.delegate = self
    }

}

