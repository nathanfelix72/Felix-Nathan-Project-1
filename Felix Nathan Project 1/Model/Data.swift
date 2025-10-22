//
//  Data.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/16/25.
//

import Foundation

let spanishTopics = [
    // MARK: - Relationships
    OgniloudModel.OgniloudTopic(
        title: "Relationships",
        terms: [
            "Madre": "Mother",
            "Padre": "Father",
            "Hermano": "Brother",
            "Hermana": "Sister",
            "Tío": "Uncle",
            "Tía": "Aunt",
            "Abuela": "Grandmother",
            "Abuelo": "Grandfather",
            "Hijo": "Son",
            "Hija": "Daughter"
        ],
        lessonContent: """
        Family is central to daily life in Spanish-speaking cultures. When talking about your relatives, these words are essential.

        - *Madre* = Mother
        - *Padre* = Father
        - *Hermano / Hermana* = Brother / Sister
        - *Abuelo / Abuela* = Grandfather / Grandmother

        Note: The endings “-o” (masculine) and “-a” (feminine) often indicate gender in Spanish nouns.
        """,
        quizData: [
            "What does 'Abuelo' mean in English?": "Grandfather",
            "How do you say 'Sister' in Spanish?": "Hermana",
            "Translate 'Mother' into Spanish.": "Madre",
            "What is 'Father' in Spanish?": "Padre",
            "What does 'Tía' mean?": "Aunt",
            "Translate 'Daughter' into Spanish.": "Hija"
        ],
        quizHighScore: 0,
        progress: [
            "Lesson": "Not completed",
            "Quiz": "Not taken",
            "Flashcards": "0/10 reviewed"
        ],
        subPages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]
    ),
    
    // MARK: - Calendar
    OgniloudModel.OgniloudTopic(
        title: "Calendar",
        terms: [
            "Lunes": "Monday",
            "Martes": "Tuesday",
            "Miércoles": "Wednesday",
            "Jueves": "Thursday",
            "Viernes": "Friday",
            "Sábado": "Saturday",
            "Domingo": "Sunday",
            "Mes": "Month",
            "Año": "Year",
            "Semana": "Week"
        ],
        lessonContent: """
        The days of the week in Spanish are **not capitalized** unless they begin a sentence.

        - *Lunes* = Monday  
        - *Martes* = Tuesday  
        - *Miércoles* = Wednesday  
        - *Jueves* = Thursday  
        - *Viernes* = Friday  
        - *Sábado* = Saturday  
        - *Domingo* = Sunday

        Days are masculine nouns and often used with the article *el* (for example, *el lunes* = “on Monday”).
        """,
        quizData: [
            "How do you say 'Friday' in Spanish?": "Viernes",
            "What is 'Lunes' in English?": "Monday",
            "Translate 'Wednesday' into Spanish.": "Miércoles",
            "What does 'Domingo' mean?": "Sunday",
            "Which day is before 'Viernes'?": "Jueves"
        ],
        quizHighScore: 0,
        progress: [
            "Lesson": "Not completed",
            "Quiz": "Not taken",
            "Flashcards": "0/10 reviewed"
        ],
        subPages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]
    ),

    // MARK: - Colors
    OgniloudModel.OgniloudTopic(
        title: "Colors",
        terms: [
            "Rojo": "Red",
            "Azul": "Blue",
            "Verde": "Green",
            "Amarillo": "Yellow",
            "Negro": "Black",
            "Blanco": "White",
            "Gris": "Gray",
            "Naranja": "Orange",
            "Rosa": "Pink",
            "Morado": "Purple"
        ],
        lessonContent: """
        Colors in Spanish must agree in **gender** and **number** with the nouns they describe.  
        For example:
        - *Camisa roja* (red shirt)  
        - *Pantalones negros* (black pants)

        Some colors like *azul* (blue) don’t change for gender.
        """,
        quizData: [
            "Translate 'Red' into Spanish.": "Rojo",
            "What does 'Negro' mean?": "Black",
            "How do you say 'Blue' in Spanish?": "Azul",
            "What color is 'Verde'?": "Green",
            "Translate 'White' into Spanish.": "Blanco",
            "What does 'Morado' mean?": "Purple"
        ],
        quizHighScore: 0,
        progress: [
            "Lesson": "Not completed",
            "Quiz": "Not taken",
            "Flashcards": "0/10 reviewed"
        ],
        subPages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]
    ),

    // MARK: - Food
    OgniloudModel.OgniloudTopic(
        title: "Food",
        terms: [
            "Manzana": "Apple",
            "Pan": "Bread",
            "Queso": "Cheese",
            "Carne": "Meat",
            "Pollo": "Chicken",
            "Agua": "Water",
            "Leche": "Milk",
            "Pescado": "Fish",
            "Fruta": "Fruit",
            "Verdura": "Vegetable",
            "Cebolla": "Onion",
            "Tomate": "Tomato",
            "Arroz": "Rice",
            "Sopa": "Soup",
            "Huevos": "Eggs"
        ],
        lessonContent: """
        Spanish meals often include fresh bread (*pan*), meat (*carne*), and cheese (*queso*).  
        Remember that foods are usually feminine or masculine, affecting the article:
        - *La manzana* (the apple)
        - *El queso* (the cheese)
        """,
        quizData: [
            "Translate 'Apple' into Spanish.": "Manzana",
            "What is 'Pan' in English?": "Bread",
            "How do you say 'Water' in Spanish?": "Agua",
            "Translate 'Chicken' into Spanish.": "Pollo",
            "What does 'Queso' mean?": "Cheese"
        ],
        quizHighScore: 0,
        progress: [
            "Lesson": "Not completed",
            "Quiz": "Not taken",
            "Flashcards": "0/10 reviewed"
        ],
        subPages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]
    ),

    // MARK: - Travel
    OgniloudModel.OgniloudTopic(
        title: "Travel",
        terms: [
            "Aeropuerto": "Airport",
            "Avión": "Airplane",
            "Tren": "Train",
            "Hotel": "Hotel",
            "Taxi": "Taxi",
            "Mapa": "Map",
            "Pasaporte": "Passport",
            "Maleta": "Suitcase",
            "Viaje": "Trip",
            "Ciudad": "City"
        ],
        lessonContent: """
        When traveling, these are essential Spanish words:
        - *Aeropuerto* = Airport
        - *Pasaporte* = Passport
        - *Maleta* = Suitcase
        - *Tren* = Train
        """,
        quizData: [
            "What does 'Aeropuerto' mean in English?": "Airport",
            "Translate 'Suitcase' into Spanish.": "Maleta",
            "How do you say 'City' in Spanish?": "Ciudad",
            "Translate 'Train' into Spanish.": "Tren",
            "What is 'Pasaporte' in English?": "Passport"
        ],
        quizHighScore: 0,
        progress: [
            "Lesson": "Not completed",
            "Quiz": "Not taken",
            "Flashcards": "0/10 reviewed"
        ],
        subPages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]
    ),

    // MARK: - Greetings
    OgniloudModel.OgniloudTopic(
        title: "Greetings",
        terms: [
            "Hola": "Hello",
            "Adiós": "Goodbye",
            "Por favor": "Please",
            "Gracias": "Thank you",
            "De nada": "You're welcome",
            "Buenos días": "Good morning",
            "Buenas tardes": "Good afternoon",
            "Buenas noches": "Good night",
            "¿Cómo estás?": "How are you?",
            "Bien": "Good"
        ],
        lessonContent: """
        Greetings are key to polite communication in Spanish-speaking countries.

        - *Hola* = Hello  
        - *Adiós* = Goodbye  
        - *Buenos días* = Good morning  
        - *Buenas noches* = Good night  

        Use *¿Cómo estás?* when speaking informally and *¿Cómo está usted?* for formal situations.
        """,
        quizData: [
            "What does 'Gracias' mean?": "Thank you",
            "How do you say 'Good morning' in Spanish?": "Buenos días",
            "Translate 'Hello' into Spanish.": "Hola",
            "What does 'Adiós' mean in English?": "Goodbye",
            "Translate 'You're welcome' into Spanish.": "De nada"
        ],
        quizHighScore: 0,
        progress: [
            "Lesson": "Not completed",
            "Quiz": "Not taken",
            "Flashcards": "0/10 reviewed"
        ],
        subPages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]
    )
]
