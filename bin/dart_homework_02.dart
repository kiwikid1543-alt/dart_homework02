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

void main() {
  StudentScore studentInfo = StudentScore(
    90,
    '홍길동',
  ); // studentInfo 이름과 점수를 가지는 객체 생성
  studentInfo.showInfo(); // 출력
}
