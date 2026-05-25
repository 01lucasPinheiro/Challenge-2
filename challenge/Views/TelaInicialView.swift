import SwiftUI

struct testeTela: View {
    @Environment(DadosCidadeData.self) var cidadeData
    
    @State var corCirculo: Color = .red
    @State private var barra1 = 150.0
    @State private var barra2 = 100.0
    @State private var navegando: Bool = false
    @State private var estadoMapa = 0
    
    var mapa: String {
        switch estadoMapa {
        case 0...2:
            return "mapa"
        default:
            return "mapa2"
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    ScrollViewReader { proxy in
                        ZStack {
                            Image(mapa)
                                .frame(width: 1500, height: 1366)
                            
                            Circle()
                                .fill(corCirculo.opacity(0.1))
                                .frame(width: 80, height: 80)
                                .position(x: 758, y: 397)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        corCirculo = .blue
                                        barra1 += 50
                                        barra2 -= 20
                                        estadoMapa += 1
                                    }
                                    navegando = true
                                }
                            
                            NuvensAnimadasView()
                        }
                        .id("centroMapa")
                        .onAppear {
                            proxy.scrollTo("centroMapa", anchor: .center)
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Spacer()
                        TermometroView(temperatura: cidadeData.poluicao)
                        TermometroView(temperatura: cidadeData.umidade)
                        TermometroView(temperatura: cidadeData.temperatura)
                    }
                    .padding()
                }

                .allowsHitTesting(true)
            }
            .navigationDestination(isPresented: $navegando) {
                JogoLixeiraView()
            }
        }
    }
}

#Preview {
    testeTela()
        .environment(DadosCidadeData())
}
