//
//  ContentView.swift
//  Meteo
//
//  Created by Ariane Luc on 05/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight) //tout en bleu
            VStack(spacing : 10) {
                CityTextView(cityName: "Paris")

                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",temperature: isNight ? 9 : 11)
                
                HStack(spacing: 28) {
                    WeatherdayView(dayOfWeek: "MAR",
                                   imageName: isNight ? "moon.fill":"sun.max.fill",
                                   temperature: isNight ? 9 : 15)
                    WeatherdayView(dayOfWeek: "MER",
                                   imageName: "wind.snow",
                                   temperature: isNight ? -1 : 0)
                    WeatherdayView(dayOfWeek: "JEU",
                                   imageName: isNight ? "moon.haze.fill":"sunset.fill",
                                   temperature: 10)
                    WeatherdayView(dayOfWeek: "VEN",
                                   imageName: isNight ? "cloud.moon.rain.fill":"cloud.sun.rain.fill",
                                   temperature: 8)
                    WeatherdayView(dayOfWeek: "SAM",
                                   imageName: "smoke.fill",
                                   temperature: 9)
                }
                Spacer() //le reste du vite est VStack
                
                Button { //what the button does
                    isNight.toggle() //si on appuie sur le bouton la isNight == true
                }label: {
                    //what the button looks like
                    MeteoButtonView(title: "Changer de temps",
                                      textColor: .blue,
                                      backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherdayView: View {
    
    var dayOfWeek : String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size:16, weight:.medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit) //doesnt look stretch
                .frame(width: 40, height:40)
            Text("\(temperature)°")
                .font(.system(size:28, weight:.medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors:[isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
            startPoint:.topLeading,
            endPoint : .bottomTrailing) //dégradé
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding();
    }
}

struct MainWeatherStatusView: View {
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit) //doesnt look stretch
                .frame(width: 180, height:180)
            Text("\(temperature)°")
                .font(.system(size:70, weight:.medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}
