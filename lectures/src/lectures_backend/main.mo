import Nat "mo:base/Nat";
import Array "mo:base/Array";

actor StudentGradingSystem {
    // Type for a student record
    type Student = {
        id: Nat;
        name: Text;
        grades: [Nat];
    };

    // Array to store students
    var students : [var Student] = [var];

    // Add a student (function not shown for brevity but would be similar)

    public func addGrade(id: Nat, grade: Nat) : async Text {
        // Loop through students to find the one with the given id
        for (i in students.keys()) {
            if (students[i].id == id) {
                // Create a new array with the added grade
                let newGrades = Array.append<Nat>(students[i].grades, [grade]);
                // Update the student's grades
                students[i] := {
                    id = students[i].id;
                    name = students[i].name;
                    grades = newGrades;
                };
                return "Grade added!";
            };
        };
        return "Student not found!";
    };

    // Other functions like getAverageGrade, etc., would be defined here
};