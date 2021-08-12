import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel: ViewModel
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(viewModel: ViewModel = ViewModel()) {
        self.viewModel = viewModel
        self.viewModel.hex = self.viewModel.updateTime()
    }
    
    var body: some View {
        ZStack {
            Color.hexStringToColor(viewModel.hex)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("\(viewModel.hex)")
                    .fontWeight(.bold)
            }
        }
        .onReceive(timer) { _ in
            viewModel.hex = viewModel.updateTime()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
