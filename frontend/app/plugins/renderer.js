export default ({ app }, inject) => {
  const sanitizeHtml = require('sanitize-html')

  const textRender = (text, img = false) => {
    const sanitizedText = beforeRenderingSanitizer(text)
    const renderedMd = app.$md.render(sanitizedText)

    const sanitizeOptions = {
      allowedTags: img
        ? myOptions.allowedTags.textAndImg
        : myOptions.allowedTags.text,
      selfClosing: myOptions.selfClosing.global,
      allowedSchemes: myOptions.allowedSchemes.global,
      allowedAttributes: myOptions.allowedAttributes.global,
      disallowedTagsMode: myOptions.disallowedTagsMode,
    }
    const sanitizedMd = sanitizeHtml(renderedMd, sanitizeOptions)

    return sanitizedMd
  }

  const mdRender = (text) => {
    const sanitizedText = beforeRenderingSanitizer(text)
    const renderedMd = app.$md.render(sanitizedText)

    const sanitizeOptions = {
      allowedTags: myOptions.allowedTags.md,
      selfClosing: myOptions.selfClosing.global,
      allowedSchemes: myOptions.allowedSchemes.global,
      allowedAttributes: myOptions.allowedAttributes.global,
      disallowedTagsMode: myOptions.disallowedTagsMode,
    }
    const sanitizedMd = sanitizeHtml(renderedMd, sanitizeOptions)

    return sanitizedMd
  }

  // 直接のタグ書き込みをサニタイズする
  const beforeRenderingSanitizer = (text) => {
    const sanitizeOptions = {
      allowedTags: myOptions.allowedTags.before,
      selfClosing: myOptions.selfClosing.global,
      disallowedTagsMode: myOptions.disallowedTagsMode,
    }
    const sanitizedText = sanitizeHtml(text, sanitizeOptions)

    return sanitizedText
  }

  // $rendererで使えるようにする
  inject('renderer', {
    text: textRender,
    md: mdRender,
  })

  const myOptions = {
    allowedTags: {
      before: ['img', 'u'],
      text: ['p', 'strong', 'br', 'u'],
      textAndImg: ['p', 'strong', 'img', 'br', 'u'],
      md: [
        'h1',
        'h2',
        'h3',
        'h4',
        'h5',
        'h6',
        'blockquote',
        'u',
        'p',
        'a',
        'ul',
        'ol',
        'nl',
        'li',
        'b',
        'i',
        'strong',
        'em',
        'strike',
        'abbr',
        'code',
        'hr',
        'br',
        'div',
        'table',
        'thead',
        'caption',
        'tbody',
        'tr',
        'th',
        'td',
        'pre',
        'iframe',
        'img',
        'br',
      ],
    },
    selfClosing: {
      global: ['img', 'br'],
    },
    allowedSchemes: {
      global: ['http', 'https'],
    },
    allowedAttributes: {
      global: {
        a: ['href', 'name', 'target'],
        img: ['src', 'alt', 'title'],
      },
    },
    disallowedTagsMode: 'escape',
  }
}
