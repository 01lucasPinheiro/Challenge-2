//
//  RostosVariaveis.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 28/05/26.
//

import SwiftUI

struct RostosVariaveis: View {
   
   var imagensRostos: [String] = ["Rosto Feliz", "Rosto Indiferente", "Rosto Mal estar"]
    var imagensRostosIndex: Int = 0
    
    var body: some View {
        
        Image(imagensRostos[imagensRostosIndex])
    }
}

#Preview {
    RostosVariaveis()
}
