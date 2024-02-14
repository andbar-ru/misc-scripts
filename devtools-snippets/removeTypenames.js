function removeTypenames() {
  const elems = document.getElementsByClassName('ͼ8j')
  for (let i = elems.length; i--; ) {
    const el = elems[i]
    if (el.textContent === '__typename') {
      const line = el.parentNode
      if (el.parentNode.className === 'cm-line') {
        el.parentNode.remove()
      }
    }
  }
}

removeTypenames()
