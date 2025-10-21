//
//  Data.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/16/25.
//

import Foundation

let spanishTopics = [
    OgniloudModel.OgniloudTopic(
        title: "Relationships",
        terms: [
            "Madre": "Mother",
            "Padre": "Father"
        ],
        lessonContent: """
            In Spanish, *mother* is _madre_ and *father* is _padre_.
            
            Family relationships are fundamental to Spanish culture. These basic terms will help you describe your family members.
            """,
        quizData: [
            "Madre": "Mother",
            "Padre": "Father"
        ],
        progress: [
            "Lesson": "Not Started",
            "Quiz": "Not Started",
            "Flashcards": "0/2 reviewed"
        ],
        subPages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]
    ),
    OgniloudModel.OgniloudTopic(
        title: "Calendar",
        terms: [
            "Lunes": "Monday",
            "Martes": "Tuesday"
        ],
        lessonContent: """
            The days of the week in Spanish are not capitalized unless they begin a sentence.
            
            Monday is *lunes* and Tuesday is *martes*.
            """,
        quizData: [
            "Lunes": "Monday",
            "Martes": "Tuesday"
        ],
        progress: [
            "Lesson": "Not Started",
            "Quiz": "Not Started",
            "Flashcards": "0/2 reviewed"
        ],
        subPages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]
    )
]
