//
//  ConteudoLegendaClasse.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 27/05/26.
//

import Foundation
import SwiftUI

struct ConteudoLegendaClasse: Hashable {
    
    var icon: String
    var widthFrame: CGFloat
    var textoLegenda: String
    
    init(icon: String, widthFrame: CGFloat, textoLegenda: String) {
        self.icon = icon
        self.widthFrame = widthFrame
        self.textoLegenda = textoLegenda
    }
}
