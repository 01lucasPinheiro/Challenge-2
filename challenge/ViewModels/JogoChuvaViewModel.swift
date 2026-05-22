//
//  JogoChuvaViewModel.swift
//  teste
//
//  Created by Lucas on 22/05/26.
//

import SwiftUI
import Observation

@Observable
class JogoChuvaViewModel {
    private var indice: Int = 0
    private var mapas: [String] = ["sc", "c1", "c2", "c3", "c4"]
    
    func mapaAtual() -> String {
        return mapas[indice]
    }
    
    func mudarMapa() {
        withAnimation(.easeInOut(duration: 1.0)) {
            indice = (indice + 1) % mapas.count
        }
    }
}
