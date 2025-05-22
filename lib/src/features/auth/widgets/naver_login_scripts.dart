abstract class NaverLoginSource {
  const NaverLoginSource._();

  /// Maintain the login state.
  static String toggleKeepLogin = """
var checkbox = document.querySelector('.input_keep');
              if (checkbox !== null) {
                checkbox.checked = true;
                checkbox.value = 'on';
              }
""";

  /// If Keep login is enabled, the ip secure switch must be off.
  static String toggleIpSecureSwitch = """
var switchElement  = document.getElementById("switch");
if (switchElement) switchElement.checked = false;

var smartLevel = document.getElementById('smart_LEVEL');
if (smartLevel) smartLevel.value = "-1";
""";

  static String inputId(String id) => """
var idField = document.getElementById('id');
idField.value = '$id';
""";

  static String inputPassword(String password) => """
var passwordField = document.getElementById('pw');
passwordField.value = '$password';
""";

  static String scrollToCaptcha = """
(() => {
  const img = document.getElementById('captchaimg');
  if (!img) return;
  const y = img.getBoundingClientRect().top + window.pageYOffset;
  window.scrollTo({ top: y, left: 0, behavior: 'auto' });
})();
""";

  static String inputCaptcha(String captcha) => """
var captchaField = document.getElementById('captcha');
captchaField.value = '$captcha';
""";

  static String clickLoginButton = """
document.querySelector('[id="log.login"]').click();
""";
}
