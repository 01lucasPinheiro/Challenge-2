//
//  BotaoPrincipalClasse.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 26/05/26.
//

import Foundation
import SwiftUI

struct BotaoPrincipalClasse: Hashable {
    
    var mostrarIcon: Bool
    var mostrarTexto: Bool
    var icon: String
    var textoBotao: String
    var radius: CGFloat
    var corTextoBotao: Color
    var corBotao: Color
    var corBotaoGradiente: Color
    var widthFrame: CGFloat
    var heightFrame: CGFloat
    var contornoBranco: Bool
    
    init(mostrarIcon: Bool, mostrarTexto: Bool, icon: String, textoBotao: String, radius: CGFloat, corTextoBotao: Color, corBotao: Color, corBotaoGradiente: Color, widthFrame: CGFloat, heightFrame: CGFloat, contornoBranco: Bool) {
        self.mostrarIcon = mostrarIcon
        self.mostrarTexto = mostrarTexto
        self.icon = icon
        self.textoBotao = textoBotao
        self.radius = radius
        self.corTextoBotao = corTextoBotao
        self.corBotao = corBotao
        self.corBotaoGradiente = corBotaoGradiente
        self.widthFrame = widthFrame
        self.heightFrame = heightFrame
        self.contornoBranco = contornoBranco
    }
}
