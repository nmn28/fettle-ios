//
//  NewActivityView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/10/24.
//

import HealthKit
import SwiftUI

extension HKWorkoutActivityType: CaseIterable {
    public static var allCases: [HKWorkoutActivityType] {
        return [
            .americanFootball, .archery, .australianFootball, .badminton, .baseball, .basketball, .bowling,
            .boxing, .climbing, .crossTraining, .curling, .cycling, .dance, .danceInspiredTraining, .elliptical,
            .equestrianSports, .fencing, .fishing, .functionalStrengthTraining, .golf, .gymnastics, .handball,
            .hiking, .hockey, .hunting, .lacrosse, .martialArts, .mindAndBody, .mixedMetabolicCardioTraining,
            .paddleSports, .play, .preparationAndRecovery, .racquetball, .rowing, .rugby, .running, .sailing,
            .skatingSports, .snowSports, .soccer, .softball, .squash, .stairClimbing, .surfingSports, .swimming,
            .tableTennis, .tennis, .trackAndField, .traditionalStrengthTraining, .volleyball, .walking, .waterFitness,
            .waterPolo, .waterSports, .wrestling, .yoga, .barre, .coreTraining, .crossCountrySkiing, .downhillSkiing,
            .flexibility, .highIntensityIntervalTraining, .jumpRope, .kickboxing, .pilates, .snowboarding, .stairs,
            .stepTraining, .wheelchairWalkPace, .wheelchairRunPace, .taiChi, .mixedCardio, .handCycling, .discSports,
            .fitnessGaming
        ]
    }
}

extension HKWorkoutActivityType {
    var name: String {
        switch self {
        case .americanFootball:             return "American Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining: return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"
        default:                            return "Other"
        }
    }

    var image: String {
        switch self {
        case .americanFootball:             return "sportscourt"
        case .archery:                      return "archerytarget"
        case .australianFootball:           return "sportscourt"
        case .badminton:                    return "sportscourt"
        case .baseball:                     return "figure.baseball"
        case .basketball:                   return "figure.basketball"
        case .bowling:                      return "sportscourt"
        case .boxing:                       return "boxingglove"
        case .climbing:                     return "mountain"
        case .crossTraining:                return "figure.walk"
        case .curling:                      return "sportscourt"
        case .cycling:                      return "bicycle"
        case .dance:                        return "music.note"
        case .danceInspiredTraining:        return "music.note"
        case .elliptical:                   return "ellipsis.circle"
        case .equestrianSports:             return "horse"
        case .fencing:                      return "sportscourt"
        case .fishing:                      return "fish"
        case .functionalStrengthTraining:   return "figure.walk"
        case .golf:                         return "sportscourt"
        case .gymnastics:                   return "person"
        case .handball:                     return "sportscourt"
        case .hiking:                       return "map"
        case .hockey:                       return "sportscourt"
        case .hunting:                      return "cross"
        case .lacrosse:                     return "sportscourt"
        case .martialArts:                  return "sportscourt"
        case .mindAndBody:                  return "yoga"
        case .mixedMetabolicCardioTraining: return "figure.walk"
        case .paddleSports:                 return "canoe"
        case .play:                         return "gamecontroller"
        case .preparationAndRecovery:       return "wrench"
        case .racquetball:                  return "sportscourt"
        case .rowing:                       return "rowing"
        case .rugby:                        return "sportscourt"
        case .running:                      return "figure.walk"
        case .sailing:                      return "sailboat"
        case .skatingSports:                return "skating"
        case .snowSports:                   return "snow"
        case .soccer:                       return "sportscourt"
        case .softball:                     return "sportscourt"
        case .squash:                       return "sportscourt"
        case .stairClimbing:                return "figure.stairs"
        case .surfingSports:                return "sportscourt"
        case .swimming:                     return "drop.triangle"
        case .tableTennis:                  return "sportscourt"
        case .tennis:                       return "sportscourt"
        case .trackAndField:                return "sportscourt"
        case .traditionalStrengthTraining:  return "figure.strengthtraining.traditional"
        case .volleyball:                   return "sportscourt"
        case .walking:                      return "figure.walk"
        case .waterFitness:                 return "drop.triangle"
        case .waterPolo:                    return "sportscourt"
        case .waterSports:                  return "sportscourt"
        case .wrestling:                    return "sportscourt"
        case .yoga:                         return "lotus"
        case .barre:                        return "sportscourt"
        case .coreTraining:                 return "figure.walk"
        case .crossCountrySkiing:           return "skis"
        case .downhillSkiing:               return "skis"
        case .flexibility:                  return "sportscourt"
        case .highIntensityIntervalTraining: return "figure.strengthtraining.traditional"
        case .jumpRope:                     return "sportscourt"
        case .kickboxing:                   return "figure.kickboxing"
        case .pilates:                      return "sportscourt"
        case .snowboarding:                 return "snow"
        case .stairs:                       return "figure.stairs"
        case .stepTraining:                 return "sportscourt"
        case .wheelchairWalkPace:           return "figure.walk"
        case .wheelchairRunPace:            return "figure.walk"
        case .taiChi:                       return "sportscourt"
        case .mixedCardio:                  return "figure.walk"
        case .handCycling:                  return "sportscourt"
        case .discSports:                   return "sportscourt"
        case .fitnessGaming:                return "sportscourt"
        default:                            return "questionmark"
        }
    }

    var color: Color {
        switch self {
        case .running, .cycling, .hiking, .walking:
            return Color.green
        case .swimming, .waterFitness, .waterPolo, .waterSports:
            return Color.teal
        case .yoga, .mindAndBody, .pilates:
            return Color.green
        case .climbing, .functionalStrengthTraining, .traditionalStrengthTraining:
            return Color.blue
        case .boxing, .martialArts, .wrestling:
            return Color.red
        case .dance, .danceInspiredTraining:
            return Color.purple
        case .rowing:
            return Color.yellow
        case .snowboarding:
            return Color.indigo
        case .elliptical, .stairClimbing:
            return Color.pink
        case .golf:
            return Color.green
        case .tennis, .tableTennis:
            return Color.orange
        case .baseball, .basketball, .soccer, .volleyball:
            return Color.red
        case .badminton, .racquetball, .squash:
            return Color.pink
        case .crossCountrySkiing, .downhillSkiing:
            return Color.indigo
        case .surfingSports, .snowSports:
            return Color.teal
        case .hockey:
            return Color.red
        case .skatingSports:
            return Color.purple
        case .equestrianSports:
            return Color.brown
        case .fishing, .hunting:
            return Color.gray
        case .handball, .lacrosse:
            return Color.pink
        case .play, .preparationAndRecovery:
            return Color.yellow
        case .discSports, .fitnessGaming:
            return Color.green
        case .mixedMetabolicCardioTraining, .mixedCardio, .highIntensityIntervalTraining:
            return Color.orange
        case .coreTraining, .stepTraining, .jumpRope, .barre, .flexibility:
            return Color.pink
        case .wheelchairWalkPace, .wheelchairRunPace, .handCycling:
            return Color.blue
        default:
            return Color.black
        }
    }
}


struct NewActivityView: View {
    @State private var selectedActivity: HKWorkoutActivityType?
    @State private var isShowingNewActivityView: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            List(HKWorkoutActivityType.allCases, id: \.self) { activity in
                HStack {
                    Image(systemName: activity.image)
                        .foregroundColor(activity.color)
                        .padding(.trailing, 8)
                    
                    Text(activity.name)
                        .foregroundColor(activity.color)
                    
                    Spacer()
                    
                    if selectedActivity == activity {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedActivity = activity
                }
            }
            .navigationTitle("Select Activity")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        // Handle the selection
                        print("Selected activity: \(selectedActivity?.name ?? "None")")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                    }
                
            }
        }
    }
}

struct NewActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NewActivityView()
    }
}
