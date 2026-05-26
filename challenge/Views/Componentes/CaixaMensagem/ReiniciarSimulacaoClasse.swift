//
//  ReiniciarSimulacaoClasse.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 26/05/26.
//

import Foundation
import SwiftUI

struct ReiniciarSimulacaoClasse: Hashable {
    
    var widthMax: CGFloat
    var heightMax: CGFloat
    var icon : String
    var tamanhoIcon: CGFloat
    var tituloMensagem : String
    var mensagem : String
    var mensagemInformativa : Bool
    var gradienteUm : Color
    var gradienteDois : Color
    var gradienteTres : Color
    var gradienteQuatro : Color
    
    init (widthMax: CGFloat, heightMax: CGFloat, icon: String, tamanhoIcon: CGFloat,
          tituloMensagem: String, mensagem: String, mensagemInformativa: Bool, gradienteUm: Color,
          gradienteDois: Color, gradienteTres: Color, gradienteQuatro: Color) {
        
        self.widthMax = widthMax
        self.heightMax = heightMax
        self.icon = icon
        self.tamanhoIcon = tamanhoIcon
        self.tituloMensagem = tituloMensagem
        self.mensagem = mensagem
        self.mensagemInformativa = mensagemInformativa
        self.gradienteUm = gradienteUm
        self.gradienteDois = gradienteDois
        self.gradienteTres = gradienteTres
        self.gradienteQuatro = gradienteQuatro
    }
}
