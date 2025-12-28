//
//  HealthScreenViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import Foundation
internal import Combine
import Vision
import UIKit
import CoreData

class HealthScreenViewModel: ObservableObject{
    
    @Published var showCamera = false

    @Published var todayInsight: String = "You look tired more than yesterday"
    
    @Published var scan: ScanState = .idle
    
    private let historyVM: HistoryViewModel

       init(historyVM: HistoryViewModel) {
           self.historyVM = historyVM
       }
    
    @Published var isAnimate = false

    
    enum ScanState{
        case idle
        case scanning
        case result(String)
        case error(String)
    }
    
    @Published var selectedStat: HealthStat?
    
    let stats: [HealthStat] = [
        HealthStat(
            title: "Mood",
            value: "Calm",
            emoji: "🙂‍↔️",
            detail: "Your mood is stable today. Keep balance."
        ),
        HealthStat(
            title: "Tired",
            value: "High",
            emoji: "😥",
            detail: "You look more tired than usual. Try resting."
        ),
        HealthStat(
            title: "Energy",
            value: "Low",
            emoji: "⚡️",
            detail: "Your energy is low. Hydration recommended."
        ),
        HealthStat(
            title: "Stress",
            value: "Medium",
            emoji: "😄",
            detail: "Stress level is manageable today."
        ),
        HealthStat(
            title: "Grateful",
            value: "Wonderful",
            emoji: "🤲",
            detail: "Positive mindset detected."
        )
    ]
    
    func analyzeFace(_ image: UIImage) async {
        guard let cgImage = image.cgImage else { return }
        
        scan = .scanning

        let request = VNDetectFaceLandmarksRequest { request, error in
            guard
                let results = request.results as? [VNFaceObservation],
                let face = results.first
            else { return }

            self.analyzeLandmarks(face)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    let insights = [
                        "You look energetic today 💪",
                        "You seem a bit tired today 😌",
                        "You look more tired than yesterday 😴",
                        "You look very and very beautiful 🤩"
                    ]
                    
                    self.scan = .result(insights.randomElement()!)
                }

        let handler = VNImageRequestHandler(cgImage: cgImage)
        try? handler.perform([request])
    }

    func analyzeLandmarks(_ face: VNFaceObservation) {
        guard let landmarks = face.landmarks else { return }

        let leftEye = landmarks.leftEye
        let rightEye = landmarks.rightEye
        let mouth = landmarks.outerLips

        let fatigueScore = calculateFatigue(
            leftEye: leftEye,
            rightEye: rightEye,
            mouth: mouth
        )

        generateInsight(score: fatigueScore)
    }

    func calculateFatigue(
        leftEye: VNFaceLandmarkRegion2D?,
        rightEye: VNFaceLandmarkRegion2D?,
        mouth: VNFaceLandmarkRegion2D?
    ) -> Int {

        var score = 0

        if let mouth, mouth.pointCount > 10 {
            score += 1
        }

        if let leftEye, leftEye.pointCount < 6 {
            score += 1
        }

        if let rightEye, rightEye.pointCount < 6 {
            score += 1
        }

        return score
    }

    func generateInsight(score: Int) {
        let insight: String

        switch score {
        case 0:
            insight = "You look energetic today 💪"
        case 1:
            insight = "You seem a bit tired today 😌"
        default:
            insight = "You look more tired than yesterday 😴"
        }

        todayInsight = insight

        historyVM.add(
            type: "Health Scan",
            title: "Face Analysis",
            subtitle: insight
        )
    }
}
