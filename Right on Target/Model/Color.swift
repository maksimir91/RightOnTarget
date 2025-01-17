//
//  Color.swift
//  Right on Target
//
//  Created by Stanislav Shut on 22.05.2024.
// Cущность "Цвет"
// Для решения задачи работы с цветом мы можем пойти двумя путями:
// - написать расширение для класса UIColor
// - создать свой тип данных
// Будем создавать свой тип данных Color
// Его возможности описаны в протоколе ColorProtocol

import UIKit

protocol ColorProtocol {
    // красный канал
    var red: UInt8 { get set }
    // зеленый канал
    var green: UInt8 { get set }
    // синий канал
    var blue: UInt8 { get set }
    // Создание цвета на основе UIColor
    init(from: UIColor)
    // получение цвета в виде HEX-строки (число  в 16-тиричной системе исчесления)
    func getByHexString() -> String
    // получение цвета в виде UIColor для отображения на сцене
    func getByUIColor() -> UIColor
}

// Структура будет использоваться совместно с дженериком SecretValue, в котором тип Т должен соответствовать протоколу Equatable
// По этой причине  не забываем указать данный протокол для структуры Color

struct Color: ColorProtocol, Equatable {
    var red: UInt8
    var green: UInt8
    var blue: UInt8
    
    init() {
        red = 0
        green = 0
        blue = 0
    }
    
    init(from color: UIColor) {
        red = UInt8(CGFloat(255)*color.cgColor.components![0])
        green = UInt8(CGFloat(255)*color.cgColor.components![1])
        blue = UInt8(CGFloat(255)*color.cgColor.components![2])
    }
    
    func getByHexString() -> String {
        // Переводим данные об интенсивности каналов в 16-тиричную систему исчисления
        // Для этого используем встроенный в тип String инициализатор
        // позволяющий изменить систему счисления переданного числового значения
        var redPart = String(red, radix: 16,uppercase: true)
        if red <= 16 {
            redPart = "0\(redPart)"
        }
        var greenPart = String(green,radix: 16,uppercase: true)
        if green <= 16 {
            greenPart = "0\(greenPart)"
        }
        var bluePart = String(blue, radix: 16, uppercase: true)
        if blue <= 16 {
            bluePart = "0\(bluePart)"
        }
        return "\(redPart)\(greenPart)\(bluePart)"
    }
    
    func getByUIColor() -> UIColor {
        // Для создания значения типа UIColor для всех трех каналов необходимо передать значения типа CGFloat
        // где каждое значение может меняться  в диапазоне от 0.0 (минимальная интенсивность канала) до 1.0 (максимальная интенсивность канала)
        // Исходя из этого, нам необходимо преобразовать имеющиеся значения от 0 до 255 в значения от 0.0 до 1.0
        // где 0 соответствует 0.0, а 255 - 1.0
        let redFloat: Float = Float(red)/255
        let greenFloat: Float = Float(green)/255
        let blueFloat: Float = Float(blue)/255
        return UIColor(red: CGFloat(redFloat), green: CGFloat(greenFloat), blue: CGFloat(blueFloat), alpha: 1)
    }
    
    // Реализация метода сравнения двух значений типа Color
    // в рамках соответствия протоколу Equatable
    static func == (lhs: Color, rhs: Color) -> Bool {
        return lhs.red == rhs.red &&
        lhs.green == rhs.green &&
        lhs.blue == rhs.blue
    }
    
}
