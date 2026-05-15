//
//  testeview.swift
//  teste
//
//  Created by Lucas on 12/05/26.
//

import SwiftUI

struct testeview: View {
    var body: some View {
        VStack {
            Text("Meu teste!")

        }.modifier(FormatoTexto())

    }
}
//ViewModifier e usado para ao invez de ficar repetindo varios modificadores reunimos todos aqui e aplicamos no text,Stacks e etc.
struct FormatoTexto: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

#Preview {
    testeview()
}
