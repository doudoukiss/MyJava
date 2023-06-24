struct Teacher {
    let id: Int
    let name: String
    var hairColor: String?
    var email: String?
}

struct Student {
    let name: String
    let favoriteTeacherID: Int
}

struct School {
    let name: String
    let teachers: [Teacher]

    func getTeacher(withID id: Int) -> Teacher? {
        for teacher in teachers {
            if teacher.id == id {
                return teacher
            }
        }
        return nil
    }
    
    func printFavoriteTeacherInfo(for student: Student) {
        guard let favoriteTeacher = getTeacher(withID: student.favoriteTeacherID) else {
            print("No teacher with the id \(student.favoriteTeacherID) works at \(name)!")
            return
        }
        print("\(student.name)'s favorite teacher is \(favoriteTeacher.name)")
        print("They have \(favoriteTeacher.hairColor ?? "no") hair")
        guard let email = favoriteTeacher.email else {
            print("They don't have an email address on file")
            return
        }
        print("Their email address is \(email)")
    }
}


let teachers = [
    Teacher(id: 592, name: "Mr. Weatherbee", hairColor: nil, email: "thebee@riverdale.com"),
    Teacher(id: 481, name: "Ms. Grundy", hairColor: "white", email: nil),
    Teacher(id: 688, name: "Mr. Adams", hairColor: "black", email: "arthurAdams@riverdale.com")
]

let riverdaleHigh = School(name: "Riverdale High", teachers: teachers)

let archie = Student(name: "Archie Andrews", favoriteTeacherID: 481)
let betty = Student(name: "Betty Cooper", favoriteTeacherID: 443)

riverdaleHigh.printFavoriteTeacherInfo(for: archie)
riverdaleHigh.printFavoriteTeacherInfo(for: betty)