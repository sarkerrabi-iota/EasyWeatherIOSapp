
import Foundation

class WeatherSwevice {
    func getWeather(city: String, completion: @escaping (Weather?)-> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city),bd&appid=11faedb8e65b47c6e91a6ae710530b07")
            else{
            completion(nil)
                return
        }
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            
            guard let data = data, error == nil else{
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse{
                let weather = weatherResponse.main
                DispatchQueue.main.async {
                    completion(weather)
                }
                
            }else {
                 DispatchQueue.main.async {
                     completion(nil)
                 }
            }
        }.resume()
        
    }
    
    
    
}
