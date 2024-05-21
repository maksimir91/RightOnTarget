//
//  Game.swift
//  Right on Target
//
//  Created by Stanislav Shut on 21.05.2024.
//

import Foundation

protocol GameProtocol {
    // Количество заработанных очков
    var score: Int { get }
    // Текущий раунд
    var currentRound: GameRoundProtocol! { get }
    // Проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    // Генератор случайного значения
    var secretValueGenerator: GeneratorProtocol! { get }
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд (обновляет загаданное число)
    func startNewRound()
}

class Game: GameProtocol {
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol!
    private var roundsCount: Int!
    
    var isGameEnded: Bool {
        if roundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append(currentRound)
    }
    
    // Загадать и вернуть новое случайное значение
    private func getNewSecretValue() -> Int {
        return secretValueGenerator.getRandomValue()
    }
}
