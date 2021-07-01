//
//  ViewController.swift
//  Reg Hex convertor
//
//  Created by Pallavi on 18/06/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var convertBtn: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var alphatxt: UITextField!
    @IBOutlet weak var bluetxt: UITextField!
    @IBOutlet weak var greentxt: UITextField!
    @IBOutlet weak var redtxt: UITextField!
    
    enum Converstion {
        case hextoRGB
        case RGBtoHex
    }
    
    var converstion : Converstion = .hextoRGB
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func ConvertHextoRGB() -> UIColor? {
        print("Red: \(redtxt.text) \n Green\(greentxt.text) \n blue \(bluetxt.text) \n alpha\(alphatxt.text)")
        guard let redtxt = UInt8(redtxt.text!,radix: 16) else { return nil }
        guard let greentxt = UInt8(greentxt.text!,radix: 16) else { return nil}
        guard let bluetxt = UInt8(bluetxt.text!,radix: 16)else { return nil }
        guard let alphatxt = Float(alphatxt.text!) else { return nil}
        
        if alphatxt > 1 || alphatxt < 0 {
            return nil
        }
        
        resultLabel.text = "Red:\(redtxt),\n Green:\(greentxt),\n blue:\(bluetxt),\n alpha:\(alphatxt)"
        let backgroundColour = UIColor(red: CGFloat(Float(redtxt)/255), green: CGFloat(Float(greentxt)/255), blue: CGFloat(Float(bluetxt)/255), alpha: CGFloat(Float(alphatxt)))
        return backgroundColour
        
    }
    func ConvertRGBtoHEX() -> UIColor? {
        print("Red: \(redtxt.text) \n Green\(greentxt.text) \n blue \(bluetxt.text) \n alpha\(alphatxt.text)")
        guard let redtxt = UInt8(redtxt.text!) else { return nil }
        guard let greentxt = UInt8(greentxt.text!) else { return nil}
        guard let bluetxt = UInt8(bluetxt.text!)else { return nil }
        guard let alphatxt = Float(alphatxt.text!) else { return nil}
        
        if alphatxt > 1 || alphatxt < 0 {
            return nil
        }
        let redstring = String(format: "%2X", redtxt)
        let greenstring = String(format: "%2X", greentxt)
        let bluestring = String(format: "%2X", bluetxt)
        
      

        
        resultLabel.text = "Hex code: #\(redstring)\(greenstring)\(bluestring)\n Aplha:\(alphatxt)"
        let backgroundColour = UIColor(red: CGFloat(Float(redtxt)/255), green: CGFloat(Float(greentxt)/255), blue: CGFloat(Float(bluetxt)/255), alpha: CGFloat(Float(alphatxt)))
        return backgroundColour


        
    }

    @IBAction func conversionbutton(_ sender: Any) {
        switch converstion {
            case .hextoRGB:
                guard let colour = ConvertHextoRGB() else {
                    return
                }
                self.view.backgroundColor = colour
            case .RGBtoHex:
                guard let colour =   ConvertRGBtoHEX() else {
                    return
                }
                self.view.backgroundColor = colour
        }
    }
    
    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            case 0:
                converstion = .hextoRGB
                convertBtn.setTitle("Convert HEX to RGB", for: .normal)
            case 1:
                converstion = .RGBtoHex
                convertBtn.setTitle("Convert RGB to HEX", for: .normal)
            default:
                converstion = .hextoRGB
                convertBtn.setTitle("Convert Hex to RGB", for: .normal)
        }
        print(converstion)
        redtxt.text?.removeAll()
        greentxt.text?.removeAll()
        alphatxt.text?.removeAll()
        bluetxt.text?.removeAll()
       // resultLabel.text = ""


        
        
    }
    
}

