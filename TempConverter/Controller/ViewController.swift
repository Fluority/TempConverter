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
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var tempSlider: UISlider! {
        didSet {
            // Slider values
            tempSlider.maximumValue = 100
            tempSlider.minimumValue = 0
            tempSlider.value = 0
        }
    }
    
    @IBOutlet weak var tempSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        celsiusLabel.text = "Cº"
        updateResultLabelValue(value: tempSlider.value)
        explanationLabel.layer.cornerRadius = 10
        explanationLabel.clipsToBounds = true
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
        
        // Either Farenheit or Kelvin
        switch tempSegment.selectedSegmentIndex {
        case 0:
            resultLabel.text = String(format: "%.f Fº", convertedTemps.fahrenheit)
        case 1:
            resultLabel.text = String(format: "%.f Kº", convertedTemps.kelvin)
        default:
            break
        }
    }
    
    // Changing the temperature
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double) {
        let fahrenheit = Double(celsius)*9/5+32
        let kelvin = Double(celsius) + 273
        return (fahrenheit, kelvin)
    }
}
