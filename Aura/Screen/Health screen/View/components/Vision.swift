//
//  Vision.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import Vision
import SwiftUI

func analyzeFace(_ image: UIImage) {
    guard let cgImage = image.cgImage else { return }

    let request = VNDetectFaceLandmarksRequest { request, error in
        guard
            let results = request.results as? [VNFaceObservation],
            let face = results.first
        else { return }

        analyzeLandmarks(face)
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

private var todayInsight: String = "You look tired more than yesterday"

func generateInsight(score: Int) {
    switch score {
    case 0:
        todayInsight = "You look energetic today 💪"
    case 1:
        todayInsight = "You seem a bit tired today 😌"
    default:
        todayInsight = "You look more tired than yesterday 😴"
    }
}

