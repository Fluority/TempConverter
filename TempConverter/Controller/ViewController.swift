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
    
    @IBOutlet weak var tempSlider: UISlider! {
        didSet {
            tempSlider.maximumValue = 100
            tempSlider.minimumValue = 0
            tempSlider.value = 0
        }
    }
    
    @IBOutlet weak var tempSegment: UISegmentedControl! // Add this IBOutlet to connect to the segmented control in the storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        celsiusLabel.text = "Cº"
        updateResultLabelValue(value: tempSlider.value)
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        updateResultLabelValue(value: tempSlider.value)
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        updateResultLabelValue(value: tempSlider.value)
    }
    
    func updateResultLabelValue(value: Float) {
        
        let celsiusTemp = Int(value)
        celsiusLabel.text = "\(celsiusTemp) Cº"
        
        let convertedTemps = convertTempFrom(celsius: celsiusTemp)
        
        switch tempSegment.selectedSegmentIndex {
        case 0:
            resultLabel.text = String(format: "%.f Fº", convertedTemps.fahrenheit)
        case 1:
            resultLabel.text = String(format: "%.f Kº", convertedTemps.kelvin)
        default:
            break
        }
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double) {
        let fahrenheit = Double(celsius)*9/5+32
        let kelvin = Double(celsius) + 273
        return (fahrenheit, kelvin)
    }
}


