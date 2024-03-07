import SwiftUI

class TimerManager: ObservableObject {
    @Published var timeRemaining: Int = 10 // Время в секундах
    var timer = Timer()
    var isRunning = false

    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
            }
        }
    }

    func stopTimer() {
        isRunning = false
        timer.invalidate()
    }
}

struct TimerView: View {
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        Text("\(timerManager.timeRemaining / 60) : \(timerManager.timeRemaining % 60, specifier: "%02d")")
            .font(.system(size: 32, weight: .bold))
            .foregroundStyle(.white)
    }
}

struct ContentView: View {
    @StateObject var timerManager = TimerManager()

    var body: some View {
        VStack {
            TimerView(timerManager: timerManager)

            if !timerManager.isRunning {
                Button("Start Timer") {
                    timerManager.startTimer()
                }
                .padding()
            } else {
                Button("Stop Timer") {
                    timerManager.stopTimer()
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
