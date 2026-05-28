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
    private var indice: Int
    private var numerosMapas = 5
    
    init(indice: Int) {
        self.indice = indice
    }

    
    func mudarMapa(cidadeData: DadosCidadeData) {
        withAnimation(.easeInOut(duration: 1.0)) {
            indice = (indice + 1) % numerosMapas
        }
        
        switch indice {
        case 0:
            cidadeData.alterarUmidade(novoValor: 0)
           
        case 1:
            cidadeData.alterarUmidade(novoValor: 0.25)
          //  NuvensAnimadasView(brigthnessCloud: -0.1)
        case 2:
            cidadeData.alterarUmidade(novoValor: 0.50)
        case 3:
            cidadeData.alterarUmidade(novoValor: 0.75)
        case 4:
            cidadeData.alterarUmidade(novoValor: 1)
        default:
            cidadeData.alterarUmidade(novoValor: 0)
        }
        
    }
    
    func intensidadeChuva() -> Int {
        return indice * 400
    }
    
    func quantidadenuvens() -> Int {
        switch indice {
        case 0: return 2
        case 1: return 3
        case 2: return 4
        case 3: return 6
        case 4: return 8
        default: return 3
        }
    }
}

