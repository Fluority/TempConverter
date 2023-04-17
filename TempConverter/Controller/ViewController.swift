//
//  ViewController.swift
//  TempConverter
//
//  Created liene.krista.neimane on 14/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var tempSlider: UISlider!{
        didSet{
            tempSlider.maximumValue = 100
            tempSlider.minimumValue = 0
            tempSlider.value = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        celsiusLabel.text = "32 Fº"
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
//        print("tempSlider:", tempSlider.value)
        updateResultLabelValue(value: tempSlider.value)
    }
    
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        updateResultLabelValue(value: tempSlider.value)
    }
    
    func updateResultLabelValue(value: Float) {
        print(value)
        
        let celsiusTemp = Int(value)
        celsiusLabel.text = "\(celsiusTemp) Cº"
        
        var convertedTempString = ""
        #warning("switch case, convertedTempString = convertTempFrom(celsius: celsiusTemp)")
    
    }
    

    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double) {
        #warning("temp calculation logic")
        return (0,0)
    }

}

