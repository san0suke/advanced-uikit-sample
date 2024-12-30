//
//  LineGraphView.swift
//  AdvancedUIKitSample
//
//  Created by Robson Cesar de Siqueira on 30/12/24.
//

import UIKit

class LineGraphView: UIView {
    var dataPoints: [CGFloat] = [] // Dados para o gráfico

    override func draw(_ rect: CGRect) {
        guard dataPoints.count > 1 else { return }
        let path = UIBezierPath()
        
        // Configurações para o gráfico
        let graphWidth = rect.width
        let graphHeight = rect.height
        let maxValue = dataPoints.max() ?? 0
        let minValue = dataPoints.min() ?? 0
        let valueRange = maxValue - minValue

        // Convertendo os pontos para coordenadas no gráfico
        let pointSpacing = graphWidth / CGFloat(dataPoints.count - 1)
        let points: [CGPoint] = dataPoints.enumerated().map { index, value in
            let x = CGFloat(index) * pointSpacing
            let normalizedValue = (value - minValue) / valueRange
            let y = graphHeight - (normalizedValue * graphHeight)
            return CGPoint(x: x, y: y)
        }

        // Criando a linha do gráfico
        path.move(to: points[0])
        for point in points.dropFirst() {
            path.addLine(to: point)
        }

        // Desenhando a linha
        UIColor.systemBlue.setStroke()
        path.lineWidth = 2
        path.stroke()

        // Adicionando círculos nos pontos
        for point in points {
            let circle = UIBezierPath(arcCenter: point, radius: 4, startAngle: 0, endAngle: .pi * 2, clockwise: true)
            UIColor.systemBlue.setFill()
            circle.fill()
        }
    }
}
