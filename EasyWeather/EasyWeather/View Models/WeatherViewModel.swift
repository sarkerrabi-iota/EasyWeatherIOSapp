
import Foundation

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherSwevice!
    
    @Published var weather = Weather()
    
    init() {
        self.weatherService = WeatherSwevice()
    }
    
    var temprature: String{
        if let temp = self.weather.temp{
            let other = (temp - 273.15) 
            return String(format: "%.2f",other)
        }else {
            return ""
        }
    }
    var humidity: String{
        if let humidity = self.weather.humidity{
            return String(format: "%.0f",humidity)
        }else {
            return ""
        }
    }
    
    var feelslike: String{
        if let feels_like = self.weather.feels_like{
            let other = (feels_like - 273.15)
            return String(format: "%.2f",other)
        }else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed ){
            fetchWeather(by: city)
        }
    }
    
    
    private func fetchWeather(by city: String){
        self.weatherService.getWeather(city: city){
            weather in
            if let weather = weather{
                self.weather = weather
            }
        }
    }
}
