import 'package:flutter/material.dart';

import '../../../../common/widgets/ui/ui_widgets.dart' show HeaderText;

class SettingsDetailFaq extends StatelessWidget {
  const SettingsDetailFaq({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      'Q1: 아이디, 비밀번호를 제대로 입력했는데 CAPTCHA 문제가 나와요.',
      'Q2: CAPTCHA 문제를 풀어도 로그인이 안돼요.',
      'Q3: 동영상 재생 시 `로딩중...` 화면에서 넘어가지 않고 재생되지 않아요.',
    ];

    final List<String> answers = [
      'A1: 치지직 OPEN API 정책이 새로 도입됨에 따라, 기존의 Cookie 방식으로 로그인하면 아이디가 보호 조치되는 경우가 있습니다.',
      'A2: [PC에서 네이버 로그인 -> 로그인 창의 네이버ID(자물쇠 아이콘) -> 로그인 목록에서 사용하지 않는 것들 전부 로그아웃 -> 안드로이드 앱 설정에서 데이터 삭제] 후 다시 로그인 해주세요.',
      'A3: [안드로이드 TV 설정 -> 기기 환경 설정 -> 다시 시작]으로 TV를 완전히 재부팅 하고 재실행 해주세요. 일부 티비에서 리모컨으로 전원을 종료해도 절전모드로 진입하고 TV가 꺼지지 않는 경우가 있습니다.',
    ];

    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        _question(questions[0]),
        _answer(answers[0]),
        const Divider(),
        _question(questions[1]),
        _answer(answers[1]),
        const Divider(),
        _question(questions[2]),
        _answer(answers[2]),
      ],
    );
  }

  Widget _question(String text) {
    return HeaderText(
      text: text,
      fontSize: 16.0,
      overflow: TextOverflow.clip,
    );
  }

  Widget _answer(String text) {
    return HeaderText(
      text: text,
      fontSize: 12.0,
      overflow: TextOverflow.clip,
    );
  }
}
