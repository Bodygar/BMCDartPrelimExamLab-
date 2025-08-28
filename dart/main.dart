import 'dart:io';

void main() {
    const double passingGradeThreshold = 60.0;
    const double maxScore = 100.0;
    const double assignmentWeight = 0.2;
    const double midtermWeight = 0.3;
    const double finalExamWeight = 0.5;

    stdout.write('Enter the student\'s name: ');
    String? studentName = stdin.readLineSync();

    double assignmentScore = getValidatedScore('assignment');
    double midtermtScore = getValidatedScore('midterm');
    double finalExamScore = getValidatedScore('final exam');

    double finalGrade = (assignmentScore * assignmentWeight) + (midtermtScore * midtermWeight) + (finalExamScore * finalExamWeight);
    
     String status;
     if (finalGrade >= passingGradeThreshold) {
        status = 'Passed';
     } else {
        status = 'Failed';
     }

     print ('\---- Student Grade Report ---');
     print ('Student Name : $studentName');
     print ('Assingment Score : ${assignmentScore.toStringAsFixed(1)}');
     print ('Midterm Score : ${midtermtScore.toStringAsFixed(1)}');
     print ('Final Exam Score : ${finalExamScore.toStringAsFixed(1)}');
     print ('Final Grade : ${finalGrade.toStringAsFixed(1)}');
     print ('Status : $status');
    }

     double getValidatedScore(String scoreType) {
        while (true) {
            try {
                stdout.write ('Enter the $scoreType score (0 - 100): ');
                String? input = stdin.readLineSync();

                if (input == null) {
                    throw FormatException('No input provided.');
                }
                
                double score = double.parse(input);

                if (score < 0 || score > 100) {
                    throw FormatException('Score must between 0 and 100.');
                }

                return score;
            } catch (e) {
                print ('invalid input: $e');
                exit(1); 
        }
    }
}
