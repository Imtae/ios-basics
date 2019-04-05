import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 6
    let PICKER_VIEW_COLUMN = 2
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageArray2 = [UIImage?]()
    var imageFileName = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    var imageFileName2 = ["06.png", "05.png", "04.png", "03.png", "02.png", "01.png"]

    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var lblImageFileName2: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            let image2 = UIImage(named: imageFileName2[i])
            imageArray.append(image)
            imageArray2.append(image2)
        }
        
        lblImageFileName.text = imageFileName[0]
        lblImageFileName2.text = imageFileName2[0]
        imageView.image = imageArray[0]
        imageView2.image = imageArray2[0]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return imageFileName.count
        } else {
            return imageFileName2.count
        }
        
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if (component == 0) {
            let imageView = UIImageView(image: imageArray[row])
            
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
            return imageView
        } else {
            let imageView2 = UIImageView(image: imageArray2[row])
            
            imageView2.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
            return imageView2
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            lblImageFileName.text = imageFileName[row]
            imageView.image = imageArray[row]
        } else {
            lblImageFileName2.text = imageFileName2[row]
            imageView2.image = imageArray2[row]
        }
        
    }

}

