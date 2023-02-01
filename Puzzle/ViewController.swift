//
//  ViewController.swift
//  Puzzle
//
//  Created by estech on 9/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    var imagenes : [String] = ["placeholder","1","2","3","4","5","6","7","8"]
    var cuadricula = (fila:1 , columna:1)
    var imagenActual = ""
    var imagenVacia = (fila:1 , columna:1)
    var guardarImagen : UIImage?
    var validar =  false
    let range = -1...1
    
    var cuadriculaVaciaNombre :UIButton!
    var cuadriculaSeleccionadaNombre :UIButton!
    
    @IBOutlet weak var stackViewPrincipal: UIStackView!

    var fila = 1
    var columna = 1
    // Button
    @IBOutlet weak var unoxunoButton: UIButton!
    @IBOutlet weak var unoxdosButton: UIButton!
    @IBOutlet weak var unoxtresButton: UIButton!
    @IBOutlet weak var dosxunoButton: UIButton!
    @IBOutlet weak var dosxdosButton: UIButton!
    @IBOutlet weak var dosxtresButton: UIButton!
    @IBOutlet weak var tresxunoButton: UIButton!
    @IBOutlet weak var tresxdosButton: UIButton!
    @IBOutlet weak var tresxtresButton: UIButton!
    
    
    //Actions botones
    @IBAction func unoxuno(_ sender: Any) {
        cuadricula = (1,1)
        cuadriculaSeleccionadaNombre = unoxunoButton
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func unoxdos(_ sender: Any) {
        cuadricula = (1,2)
        cuadriculaSeleccionadaNombre = unoxdosButton
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func unoxtres(_ sender: Any) {
        cuadricula = (1,3)
        cuadriculaSeleccionadaNombre = unoxtresButton
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func dosxuno(_ sender: Any) {
        cuadricula = (2,1)
        cuadriculaSeleccionadaNombre = dosxunoButton
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func dosxdos(_ sender: Any) {
        cuadricula = (2,2)
        cuadriculaSeleccionadaNombre = dosxdosButton
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func dosxtres(_ sender: Any) {
        cuadricula = (2,3)
        cuadriculaSeleccionadaNombre = dosxtresButton
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func tresxuno(_ sender: Any) {
        cuadricula = (3,1)
        cuadriculaSeleccionadaNombre = tresxunoButton
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func tresxdos(_ sender: Any) {
        cuadricula = (3,2)
        cuadriculaSeleccionadaNombre = tresxdosButton
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func tresxtres(_ sender: Any) {
        cuadricula = (3,3)
        cuadriculaSeleccionadaNombre = tresxtresButton
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackViewPrincipal.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        stackViewPrincipal.isLayoutMarginsRelativeArrangement = true

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let cuadriculasBg = [unoxunoButton,unoxdosButton,unoxtresButton,dosxunoButton,dosxdosButton,dosxtresButton,tresxunoButton,tresxdosButton,tresxtresButton]

        for cuadro in cuadriculasBg{
            
            let random = Int.random(in: 0...imagenes.count-1)
        cuadro!.setBackgroundImage(UIImage(named: imagenes[random]), for: .normal)
            cuadro!.titleLabel?.text = imagenes[random]
        imagenes.remove(at: random)
            
            if cuadro!.titleLabel?.text == "placeholder"{
                imagenVacia = (fila,columna)
                cuadriculaVaciaNombre = cuadro
            }
            //Estructura para movernos por la cuadricula
            if fila <= 3{
                columna += 1
                if columna > 3{
                    fila += 1
                    columna = 1
                }
            }
            
        }
    }
    func comprobar(_ cuadriculaSeleccionadaNombre : UIButton) {
        let valorFila = abs(cuadricula.fila - imagenVacia.fila)
        let valorColumna = abs(cuadricula.columna - imagenVacia.columna)

        if (valorFila == 0 && valorColumna == 1 ) || (valorColumna == 0 && valorFila == 1){
            validar = true
        }
        if validar{
            cuadriculaVaciaNombre.setBackgroundImage(cuadriculaSeleccionadaNombre.currentBackgroundImage, for: .normal)
            cuadriculaVaciaNombre = cuadriculaSeleccionadaNombre
            cuadriculaSeleccionadaNombre.setBackgroundImage(UIImage(named: "placeholder"), for: .normal)
            imagenVacia = cuadricula
        }
        validar = false
        
        //Comprobar si se ha formado la imagen complemtamente y en el caso de que sí, enviar a otra pantall
        if unoxunoButton.currentBackgroundImage == UIImage(named: "1") &&
            dosxunoButton.currentBackgroundImage == UIImage(named: "2") &&
            tresxunoButton.currentBackgroundImage == UIImage(named: "3") &&
            dosxunoButton.currentBackgroundImage == UIImage(named: "4") &&
            dosxdosButton.currentBackgroundImage == UIImage(named: "5") &&
            dosxtresButton.currentBackgroundImage == UIImage(named: "6") &&
            tresxunoButton.currentBackgroundImage == UIImage(named: "7") &&
            tresxdosButton.currentBackgroundImage == UIImage(named: "8") &&
            tresxtresButton.currentBackgroundImage == UIImage(named: "placeholder") {

            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "pantalla_Final") as! ViewControllerDos
    
            self.present(vc, animated: true, completion: nil)
        }
       
    }
        
    
}

