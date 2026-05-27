//
//  LegendaClasse.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 27/05/26.
//

import Foundation
import SwiftUI

struct LegendaClasse: Hashable{
    let titulo: String
    var widthMax: CGFloat
    var heightMax: CGFloat
    let radius: CGFloat
    
    init(titulo: String, widthMax: CGFloat, heightMax: CGFloat, radius: CGFloat) {
        self.titulo = titulo
        self.widthMax = widthMax
        self.heightMax = heightMax
        self.radius = radius
    }
}

