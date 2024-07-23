/// Naver login JavaScript source for webview.
///
/// Use as the source for evalutaeJavascript ot the Webview controller.
class NaverLoginJavaScriptSource {
  String inputId(String id) => """
      var idField = document.getElementById('id');
      if (idField.value === '') {
      idField.value = '$id';
      }
    """;

  String inputPassword(String password) => """
      var passwordField = document.getElementById('pw');
      if (passwordField.value === ''){
      passwordField.value = '$password';
      }
    """;

  String inputPasswordAndFocusCaptcha(String password) => """
      var passwordField = document.getElementById('pw');
      if (passwordField.value === ''){
      passwordField.value = '$password';
      }
      var captchaField = document.getElementById('captcha');
      captchaField.focus();
      """;

  String inputCaptcha(String captcha) => """
      var captchaField = document.getElementById('captcha');
      if (captchaField.value === ''){
      captchaField.value = '$captcha';
      }
      """;

  String clickLoginButton() => """
      document.querySelector('[id="log.login"]').click();
      """;

  String toggleKeepLogin() => """
var checkbox = document.querySelector('.input_keep');
              if (checkbox !== null) {
                checkbox.checked = true;
                checkbox.value = 'on';
              }
""";
}
