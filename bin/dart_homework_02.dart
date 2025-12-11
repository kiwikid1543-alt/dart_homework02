import 'dart:io';

class Score {
  int score; // 점수, 인스턴스 변수 정의
  Score(this.score); // 생성자

  void showInfo() {
    // 메서드 정의
    print('점수: $score');
  }
}

class StudentScore extends Score {
  // extends를 사용하여 Score클래스를 상속
  String name; // 이름, 인스턴스 변수 정의

  StudentScore(super.score, this.name); //생성자, super을 사용하여 기능 확장
  @override // showInfo 메서드를 @override를 사용하여 재정의
  void showInfo() {
    print('이름: $name, 점수: $score');
  }
}

void main() async {
  // StudentScore studentInfo = StudentScore(
  //   90,
  //   '홍길동',
  // ); // studentInfo 이름과 점수를 가지는 객체 생성
  // studentInfo.showInfo(); // 출력

  // 1. 파일불러오기
  File txtFile = File('students.txt');
  String content = await txtFile.readAsString();
  // 2. 첫번째 줄불러오기
  List<String> lines = content.split('\n');
  List<Student> studentList = [];
  // 3. 이름과 점수 구분짓기
  for (String nameAndScore in lines) {
    List<String> nameAndScoreList = nameAndScore.split(',');
    String name = nameAndScoreList[0];
    int score = int.tryParse(nameAndScoreList[1]) ?? 0;
    // print(name);
    // print(score);

    Student s = Student(name, score);
    studentList.add(s);
  }
  print('어떤 학생의 점수를 확인하시겠습니까?');
  String userIuput = stdin.readLineSync()!; //사용자의 입력을 받아 문자열로 반환
  Student? target;
  for (var student in studentList) {
    if (student.name == userIuput) {
      print('이름: ${student.name}, 점수:${student.score}');
      target =
          student; // target이 student.name과 비교하는 줄 알아서 student.name이라고 적었다, 하지만 student를 넣어줘야한다.
      break;
    }
  }

  if (target == null) {
    print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요');
  }
}

class Student {
  String name;
  int score;
  Student(this.name, this.score);
}
