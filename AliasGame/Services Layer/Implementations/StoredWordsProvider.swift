//
//  StoredWordsProvider.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 01/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
import CoreData

class StoredWordsProvider: WordsProviderProtocol {
    
    struct WordListFile {
        let fileName: String
        let language: Word.Language
        let category: Word.Category
    }
    
    weak var delegate: WordsProviderDelegate?
    
    private var stack: CoreDataStackProtocol
    
    let wordListFiles: [WordListFile] = [
        WordListFile(fileName: "russian_words_presentation", language: .russian, category: .presentation),
        WordListFile(fileName: "russian_words_nouns", language: .russian, category: .noun),
        WordListFile(fileName: "russian_words_verbs", language: .russian, category: .verb),
        WordListFile(fileName: "russian_words_adjectives", language: .russian, category: .adjective),
        WordListFile(fileName: "english_words_nouns", language: .english, category: .noun),
        WordListFile(fileName: "english_words_verbs", language: .english, category: .verb)
    ]
    
    
    init(coreDataStack: CoreDataStackProtocol) {
        self.stack = coreDataStack
        if !UserDefaults.standard.bool(forKey: "wordsAvailable") {
            self.loadWords()
            UserDefaults.standard.set(true, forKey: "wordsAvailable")
            UserDefaults.standard.set(1, forKey: "wordList")
        }
    }
    
    
    func getWords(number: Int, language: Word.Language, category: Word.Category) {
        let fetchedResultsController = configuredFRC(language: language, category: category)

        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("[StoredWordsProvider]: " + error.localizedDescription)
        }
        
        let numberOfAvailableWords = fetchedResultsController.sections?.first?.numberOfObjects ?? 0
        guard let delegate = delegate else {
            assertionFailure("[StoredWordsProvider]: delegate is nil")
            return
        }
        var words: [Word] = []
        for _ in 0..<min(number, numberOfAvailableWords) {
            let randomRowIndex = Int(arc4random_uniform(UInt32(numberOfAvailableWords)))
            let wordIndexPath = IndexPath(row: randomRowIndex, section: 0)
            words += [fetchedResultsController.object(at: wordIndexPath)]
        }
        delegate.wordsProviderDidGetWords(words: words.map{ $0.word })
    }
    
    private func loadWords() {
        for file in wordListFiles {
            loadWords(from: file)
        }
    }
    
    private func loadWords(from file: WordListFile) {
        if let fileURL = Bundle.main.url(forResource: file.fileName, withExtension: "csv") {
            do {
                let words = try String(contentsOf: fileURL)
                for wordString in words.split(separator: ",") {
                    stack.writeContext.performAndWait {
                        let word = Word(context: self.stack.writeContext)
                        word.categoryData = file.category.rawValue
                        word.languageData = file.language.rawValue
                        word.wordData = String(wordString)
                    }
                }
                try self.stack.writeContext.save()
            } catch {
                assertionFailure("[StoredWordsProvider]: \(error.localizedDescription)")
            }
        } else {
            assertionFailure("[StoredWordsProvider]: fileURL is nil")
        }
    }
    
    private func configuredFRC(language: Word.Language, category: Word.Category) -> NSFetchedResultsController<Word> {
        let sortDescriptor = NSSortDescriptor(key: "wordData", ascending: true)
        let request = NSFetchRequest<Word>(entityName: "Word")
        request.predicate = NSPredicate(format: "languageData = %d AND categoryData = %d", language.rawValue, category.rawValue)
        request.sortDescriptors = [sortDescriptor]
        request.fetchBatchSize = 1
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: request,
                                                              managedObjectContext: stack.readContext,
                                                              sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultsController
    }
    
}
