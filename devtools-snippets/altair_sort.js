var fields = document.querySelectorAll('.doc-viewer-item-query')

fields = [...fields].filter(field => {
  const style = getComputedStyle(field)
  return !(style.width === 'auto' && style.height === 'auto')
})

fields.sort((field1, field2) => {
  const name1 = field1.querySelector('.no-link-link').textContent.trim()
  const name2 = field2.querySelector('.no-link-link').textContent.trim()
  if (name1 < name2) {
    return -1
  } else if (name1 > name2) {
    return 1
  } else {
    return 0
  }
})

var parent = fields[0].parentNode
for (const field of fields) {
  var parent = field.parentNode
  parent.removeChild(field)
  parent.appendChild(field)
}
