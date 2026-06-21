part of 'auth_web_view_flow.dart';

abstract final class _AuthWebViewLoginScripts {
  static String injectCredentials({
    required String id,
    required String password,
    required String captcha,
    required bool shouldSetCaptcha,
  }) {
    final idValue = jsonEncode(id.trim());
    final passwordValue = jsonEncode(password);
    final captchaValue = jsonEncode(captcha.trim());
    final shouldSetCaptchaValue = shouldSetCaptcha ? 'true' : 'false';

    return '''
(() => {
  const assignInputValue = (element, value) => {
    if (!element) {
      return false;
    }

    try {
      element.focus({ preventScroll: true });
    } catch (_) {
      try {
        element.focus();
      } catch (_) {}
    }

    const prototype = Object.getPrototypeOf(element);
    const descriptor =
        Object.getOwnPropertyDescriptor(prototype, 'value') ??
        Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, 'value');
    if (descriptor && descriptor.set) {
      descriptor.set.call(element, value);
    } else {
      element.value = value;
    }

    try {
      element.dispatchEvent(
        new InputEvent('input', {
          bubbles: true,
          composed: true,
          inputType: 'insertReplacementText',
          data: value,
        })
      );
    } catch (_) {
      element.dispatchEvent(new Event('input', { bubbles: true }));
    }
    element.dispatchEvent(new Event('change', { bubbles: true }));

    try {
      element.blur();
    } catch (_) {}

    return element.value === value;
  };

  const setValue = (selectors, value) => {
    for (const selector of selectors) {
      const element = document.querySelector(selector);
      if (!element) {
        continue;
      }

      return assignInputValue(element, value);
    }
    return false;
  };

  const didSetId = setValue(
    ['#id', 'input[name="id"]', 'input[id="id"]'],
    $idValue,
  );
  const didSetPassword = setValue(
    ['#pw', 'input[name="pw"]', 'input[type="password"]'],
    $passwordValue,
  );
  if (!$shouldSetCaptchaValue) {
    return didSetId && didSetPassword;
  }

  const didSetCaptcha = setValue(
    [
      '#captcha',
      'input[name="captcha"]',
      'input[id*="captcha"]',
      'input[name*="captcha"]',
    ],
    $captchaValue,
  );

  return didSetId && didSetPassword && didSetCaptcha;
})();
''';
  }

  static String ensureKeepLoginReady() {
    return '''
(async () => {
  const wait = (milliseconds) =>
      new Promise((resolve) => window.setTimeout(resolve, milliseconds));

  const dispatchInputEvents = (element) => {
    element.dispatchEvent(new Event('input', { bubbles: true }));
    element.dispatchEvent(new Event('change', { bubbles: true }));
  };

  const readKeepLoginState = () => {
    const keep =
        document.querySelector('div#keep[role="checkbox"]') ??
        document.querySelector('div#keep') ??
        document.querySelector('#keep');
    const checkbox =
        document.querySelector('input#nvlong[name="nvlong"]') ??
        document.querySelector('input#nvlong') ??
        document.querySelector('input[name="nvlong"]') ??
        document.querySelector('input.input_keep') ??
        document.querySelector('.input_keep');
    const checked =
        keep?.getAttribute('aria-checked') === 'true' ||
        checkbox?.checked === true ||
        checkbox?.value === 'on';

    return { keep, checkbox, checked };
  };

  const syncKeepLoginState = () => {
    const state = readKeepLoginState();
    if (state.checkbox !== null) {
      state.checkbox.checked = true;
      state.checkbox.value = 'on';
      dispatchInputEvents(state.checkbox);
    }
    if (state.keep !== null) {
      state.keep.setAttribute('aria-checked', 'true');
      state.keep.classList.add('check');
    }

    return readKeepLoginState().checked;
  };

  for (let attempt = 0; attempt < 6; attempt += 1) {
    const state = readKeepLoginState();
    if (state.checked) {
      return syncKeepLoginState();
    }

    const keep = state.keep;
    if (keep !== null) {
      try {
        keep.click();
      } catch (_) {}
    }

    await wait(attempt === 0 ? 0 : 50);

    if (readKeepLoginState().checked) {
      return syncKeepLoginState();
    }
  }

  return syncKeepLoginState();
})();
''';
  }

  static String submitLoginForm() {
    return '''
(() => {
  const loginButton =
      document.getElementById('log.login') ??
      document.querySelector('button[type="submit"]') ??
      document.querySelector('input[type="submit"]') ??
      document.querySelector('.btn_login');

  if (loginButton) {
    loginButton.click();
    return true;
  }

  const form = document.querySelector('form');
  if (!form) {
    return false;
  }

  if (typeof form.requestSubmit === 'function') {
    form.requestSubmit();
    return true;
  }

  return form.dispatchEvent(
    new Event('submit', { bubbles: true, cancelable: true })
  );
})();
''';
  }
}
