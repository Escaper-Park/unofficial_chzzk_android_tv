part of 'auth_web_view_flow.dart';

abstract final class _AuthWebViewCaptchaScripts {
  static String scrollToCaptcha() {
    return '''
(() => {
  const pickFirst = (selectors) => {
    for (const selector of selectors) {
      const element = document.querySelector(selector);
      if (element) {
        return element;
      }
    }
    return null;
  };

  const loginButton =
      document.getElementById('log.login') ??
      pickFirst([
        'button[type="submit"]',
        'input[type="submit"]',
        '.btn_login',
      ]);
  const fallback =
      pickFirst([
        '#captcha',
        'input[name="captcha"]',
        'input[id*="captcha"]',
        'input[name*="captcha"]',
        '#captchaimg',
        '.captcha',
      ]);
  const target = loginButton ?? fallback;
  if (!target) {
    return;
  }

  const rect = target.getBoundingClientRect();
  const top = window.scrollY + rect.bottom - window.innerHeight;
  window.scrollTo({
    top: Math.max(0, top),
    left: window.scrollX,
    behavior: 'auto',
  });
})();
''';
  }

  static String syncCaptchaImageOverlay({
    required bool visible,
    required double height,
  }) {
    final visibleValue = visible ? 'true' : 'false';
    final heightValue = height.toStringAsFixed(0);

    return '''
(() => {
  const overlayClassName = 'chzzk-tv-captcha-overlay-image';
  const markerAttribute = 'data-chzzk-tv-captcha-overlay';
  const pickFirst = (selectors) => {
    for (const selector of selectors) {
      const element = document.querySelector(selector);
      if (element) {
        return element;
      }
    }
    return null;
  };

  const restore = () => {
    const previous = document.querySelector('[' + markerAttribute + '="true"]');
    if (!previous) {
      return;
    }

    previous.classList.remove(overlayClassName);
    previous.removeAttribute(markerAttribute);
    previous.style.cssText = previous.dataset.chzzkTvPreviousStyle || '';
    previous.removeAttribute('tabindex');
    delete previous.dataset.chzzkTvPreviousStyle;
  };

  if (!$visibleValue) {
    restore();
    return;
  }

  const candidate =
      pickFirst([
        '#captchaimg',
        '#captcha_image',
        'img[id*="captcha"]',
        'img[src*="captcha"]',
        '.captcha img',
        '.captcha_wrap img',
      ]);
  const image = candidate?.tagName?.toLowerCase() === 'img'
      ? candidate
      : candidate?.querySelector?.('img');
  if (!image) {
    return;
  }

  const previous = document.querySelector('[' + markerAttribute + '="true"]');
  if (previous && previous !== image) {
    restore();
  }

  if (!image.hasAttribute(markerAttribute)) {
    image.dataset.chzzkTvPreviousStyle = image.getAttribute('style') || '';
  }
  image.setAttribute(markerAttribute, 'true');
  image.setAttribute('tabindex', '-1');
  image.classList.add(overlayClassName);
  image.style.cssText = [
    image.dataset.chzzkTvPreviousStyle || '',
    'position: fixed !important',
    'top: 0 !important',
    'left: 50% !important',
    'right: auto !important',
    'bottom: auto !important',
    'width: auto !important',
    'height: ${heightValue}px !important',
    'max-width: calc(100vw - 24px) !important',
    'object-fit: contain !important',
    'transform: translateX(-50%) !important',
    'z-index: 2147483647 !important',
    'pointer-events: none !important',
    'user-select: none !important',
    'background: #ffffff !important',
  ].join('; ');
})();
''';
  }

  static String readLoginPageState() {
    return '''
(() => {
  const pickFirst = (selectors) => {
    for (const selector of selectors) {
      const element = document.querySelector(selector);
      if (element) {
        return element;
      }
    }
    return null;
  };

  const isVisible = (element) => {
    if (!element) {
      return false;
    }

    const style = window.getComputedStyle(element);
    const rect = element.getBoundingClientRect();
    return style.display !== 'none' &&
        style.visibility !== 'hidden' &&
        style.opacity !== '0' &&
        rect.width > 0 &&
        rect.height > 0;
  };

  const captchaInput = pickFirst([
    '#captcha',
    'input[name="captcha"]',
    'input[id*="captcha"]',
    'input[name*="captcha"]',
  ]);
  const captchaContainer = pickFirst([
    '#captchaimg',
    '#captcha_image',
    '#captcha_wrap',
    '.captcha',
    '.captcha_wrap',
  ]);
  return JSON.stringify({
    captchaRequired: isVisible(captchaInput) || isVisible(captchaContainer),
  });
})();
''';
  }
}
