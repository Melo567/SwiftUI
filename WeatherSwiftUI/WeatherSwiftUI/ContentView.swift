import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight)
             
            VStack {
                
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherView(imageName: "cloud.sun.fill", temperature: 76)
                
                HStack {
                    DayWeatherView(day: "TUE", iconName: "cloud.sun.fill", temperature: 32)
                    DayWeatherView(day: "TUE", iconName: "cloud.sun.fill", temperature: 32)
                    DayWeatherView(day: "TUE", iconName: "cloud.sun.fill", temperature: 32)
                    DayWeatherView(day: "TUE", iconName: "cloud.sun.fill", temperature: 32)
                    DayWeatherView(day: "SAT", iconName: "snow", temperature: 32)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(label: "Change Time Day")
                }
                
                Spacer()
            }
        }
    }
}


struct DayWeatherView: View {
    
    var day: String
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 38, height: 38)
            Text("\(temperature)")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
                .padding()
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)")
                .font(.system(size: 60, weight: .medium, design: .none))
                .foregroundStyle(.white)
                .padding()
            
        }
        .padding(.bottom, 58)
    }
}

struct WeatherButtonView: View {
    
    var label: String
    
    var body: some View {
        Text(label)
            .frame(width: 280, height: 48)
            .font(.system(size: 16, weight: .medium))
            .background(.white)
            .cornerRadius(10)
    }
}


#Preview {
    ContentView()
}
