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
    let radius: CGFloat
    
    init(titulo: String, radius: CGFloat) {
        self.titulo = titulo
        self.radius = radius
    }
}

