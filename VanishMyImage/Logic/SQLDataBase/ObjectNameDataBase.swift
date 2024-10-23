//
//  ObjectNameDataBase.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 22.10.24.
//

import Foundation
import UIKit
import SQLite

class ObjectNameDatabase {
    private var db: Connection?
    private let objectNamesTable = Table("objectNames")
    
    private let id = Expression<Int64>("id")
    private let originalName = Expression<String>("originalName")
    private let correctedName = Expression<String>("correctedName")
    
    init() {
        // Инициализация базы данных в Documents Directory
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("objects").appendingPathExtension("sqlite3")
            db = try Connection(fileUrl.path)
            
            createTable()
        } catch {
            print("Ошибка подключения к базе данных: \(error)")
        }
    }
    
    // Создаем таблицу для хранения названий объектов
    private func createTable() {
        do {
            // Выполняем SQL-запрос для создания таблицы, если она не существует
            try db?.run(objectNamesTable.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(originalName, unique: true)
                table.column(correctedName)
            })
            print("Таблица создана успешно или уже существует")
        } catch {
            print("Ошибка создания таблицы: \(error)")
        }
    }

    //если распознало правильно
    func saveConfirmation(originalName: String, correctedName: String) {
        do {
            let insert = objectNamesTable.insert(self.originalName <- originalName, self.correctedName <- correctedName)
            try db?.run(insert)
            print("Подтверждение сохранено успешно")
        } catch {
            print("Ошибка при сохранении подтверждения: \(error)")
        }
    }
    
    // Функция для сохранения исправленного названия
    func saveCorrectedName(for object: String, correctedName: String) {
        let insert = objectNamesTable.insert(self.originalName <- object, self.correctedName <- correctedName)
        do {
            try db?.run(insert)
            print("Исправление сохранено")
        } catch {
            print("Ошибка сохранения исправления: \(error)")
        }
    }
    
    // Получение исправленного названия для объекта
    func getCorrectedName(for object: String) -> String? {
        let query = objectNamesTable.filter(originalName == object)
        do {
            if let object = try db?.pluck(query) {
                return object[correctedName]
            }
        } catch {
            print("Ошибка поиска исправленного названия: \(error)")
        }
        return nil
    }
}
