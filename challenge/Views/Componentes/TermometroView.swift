//
//  testeTermometro.swift
//  teste
//
//  Created by Lucas on 20/05/26.
//

import SwiftUI

struct TermometroView: View {
    @State private var temperatura: CGFloat = 0.1
    private let altura: CGFloat = 300
    private let largura: CGFloat = 50
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                Capsule()
                    .fill(Color.gray)
                    .frame(width: largura, height: altura)
                
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [.red, .orange, .yellow, .green],
                            startPoint: .top,
                            endPoint: .bottom,
                        )
                    ).frame(width: largura, height: altura)
                    .mask(
                        VStack {
                            Spacer(minLength: 0)
                            Rectangle()
                                .frame(height: altura * temperatura)
                        }
                    )
            }
        }
    }
}

#Preview {
    TermometroView()
}
