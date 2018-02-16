//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Victor Zhong on 2/16/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Outlets and Properties
    var crayon: Crayon!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!

    @IBOutlet var labelCollection: [UILabel]!

    @IBOutlet var sliderCollection: [UISlider]!

    var red: Float!
    var green: Float!
    var blue: Float!
    var alpha: Double!

    @IBOutlet weak var alphaStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = crayon.name
        setInitialBackgroundColorAndSliderValues()
    }

    // MARK: - Functions and Methods
    @IBAction func alphaStepperTapped(_ sender: UIStepper) {
        alpha = alphaStepper.value
        alphaLabel.text = "Alpha: " + String(format: "%.01f", alpha)
        updateColors()
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        setInitialBackgroundColorAndSliderValues()
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            red = sender.value
            redLabel.text = "Red: " + String(format: "%.01f", red * 255)
        case 1:
            green = sender.value
            greenLabel.text = "Green: " + String(format: "%.01f", green * 255)
        case 2:
            blue = sender.value
            blueLabel.text = "Blue: " + String(format: "%.01f", blue * 255)
        default:
            break
        }

        updateColors()
    }

    func updateColors() {
        view.backgroundColor = UIColor(displayP3Red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
        _ = labelCollection.map {
            $0.textColor = UIColor(displayP3Red: CGFloat(1 - red), green: CGFloat(1 - green), blue: CGFloat(1 - blue), alpha: 1)
        }

        if alpha <= 0.3 {
            _ = labelCollection.map {
                $0.textColor = .white
            }
        }
    }

    func setInitialBackgroundColorAndSliderValues() {
        red = Float(crayon.red / 255)
        green = Float(crayon.green / 255)
        blue = Float(crayon.blue / 255)

        redLabel.text = "Red: \(crayon.red)"
        greenLabel.text = "Green: \(crayon.green)"
        blueLabel.text = "Blue: \(crayon.blue)"
        alphaLabel.text = "Alpha: 1.0"

        sliderCollection[0].value = red
        sliderCollection[1].value = green
        sliderCollection[2].value = blue

        alpha = 1.0
        alphaStepper.value = 1.0

        updateColors()
    }
}

