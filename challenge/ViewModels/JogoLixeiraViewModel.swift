//
//  JogoLixeiraViewModel.swift
//  teste
//
//  Created by Lucas on 21/05/26.
//

import SwiftUI
import Observation

@Observable
class JogoLixeiraViewModel {
    var posicao: [CGSize] = Array(repeating: .zero, count: 5)
    var lixeirasAbertas: [Bool] = Array(repeating: false, count: 5)
    var lixeiraCerta: [Int] = [0, 1, 2, 3, 4].shuffled() //aleatorizar a posicao
    var pontuacao = 0
    var framesLixeiras: [CGRect] = Array(repeating: .zero, count: 5)
    
    func nomeImagemLixeira(para index: Int) -> String {
        return lixeirasAbertas[index] ? "lixeiraAberta" : "lixeiraFechada"
    }
    
    func atualizarArrasto(index: Int, translacao: CGSize, localizacao: CGPoint) {
        posicao[index] = translacao
        for i in 0..<5 {
            lixeirasAbertas[i] = framesLixeiras[i].contains(localizacao)
        }
    }
    
    func finalizarArrasto(index: Int, localizacao: CGPoint) {
        for indexDaLixeira in 0..<5 {
            print(framesLixeiras[indexDaLixeira])
            print(localizacao)
            if framesLixeiras[indexDaLixeira].contains(localizacao) {
                
                if !lixeiraCerta.isEmpty {
                    let lixeiraCorreta = lixeiraCerta[index]
                    if indexDaLixeira == lixeiraCorreta {
                        pontuacao += 1
                    } else {
                        pontuacao -= 1
                    }
                }
                break
            }
        }
        
        posicao[index] = .zero
        for i in 0..<5 {
            lixeirasAbertas[i] = false
        }
    }
}
