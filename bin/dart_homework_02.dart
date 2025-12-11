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

  StudentScore(this.name, super.score); //생성자, super을 사용하여 기능 확장
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
  File txtFile = File('students.txt'); // 텍스트 문서 불러오기
  String content = await txtFile.readAsString(); // 문자열로 읽어오기
  // 2. 첫번째 줄불러오기
  List<String> lines = content.split('\n'); // 띄어쓰기 기준으로 리스트로 분리
  List<StudentScore> studentList = [];
  // 3. 이름과 점수 구분짓기
  for (String nameAndScore in lines) {
    List<String> nameAndScoreList = nameAndScore.split(',');
    String name = nameAndScoreList[0];
    int score = int.tryParse(nameAndScoreList[1]) ?? 0;
    StudentScore s = StudentScore(name, score);
    studentList.add(s);
  }
  //
  //
  print('어떤 학생의 점수를 확인하시겠습니까?');
  String userIuput = stdin.readLineSync()!; //사용자의 입력을 받아 문자열로 반환
  StudentScore? target;
  for (var student in studentList) {
    if (student.name == userIuput) {
      student.showInfo();
      target =
          student; // target이 student.name과 비교하는 줄 알아서 student.name이라고 적었다, 하지만 student를 넣어줘야한다.
      break;
    }
  }
  if (target == null) {
    print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요');
  } else {
    // 1. 출력된 값 저장하기
    // 2. 저장완료 메시지 출력
    File txtSave = File('results.txt'); // 저장할 파일 위치 설정

    try {
      txtSave.writeAsStringSync(
        '이름: ${target.name} 점수: ${target.score}',
      ); // 파일을 읽거나 쓸때 에러를 막기위해 try
      print('저장이 완료되었습니다.');
    } catch (e) {
      print('저장에 실패했습니다: $e');
    }
  }
}
