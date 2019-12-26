

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    
    var body: some View {
        VStack(alignment: .center){
            TextField("Enter city name", text: self.$weatherVM.cityName){
                self.weatherVM.search()
                }
            .font(.largeTitle)
            .padding(10)
            
            
            Text(self.weatherVM.feelslike)
              .font(.title)
              .padding(5)
            
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.blue)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
