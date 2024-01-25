var fields = document.querySelectorAll('.doc-viewer-item-query')

fields = [...fields].filter(field => {
    const style = getComputedStyle(field)
    return !(style.width === 'auto' && style.height === 'auto')
})

var nameNodes = []

fields.forEach(field => {
  var nameNode = field.querySelector('.no-link-link')
  if (!nameNode) {
    console.debug(field)
    console.error('There is no ".no-link-link" element in this field.')
    return
  }
  var parent = field.parentNode
  nameNode.field = field
  nameNode.parent = parent
  nameNodes.push(nameNode)
})

nameNodes.sort((node1, node2) => {
    const name1 = node1.textContent.trim()
    const name2 = node2.textContent.trim()
    if (name1 < name2) {
        return -1
    } else if (name1 > name2) {
        return 1
    } else {
        return 0
    }
})

nameNodes.forEach(nameNode => {
  nameNode.parent.removeChild(nameNode.field)
  const div = document.createElement('div')
  div.appendChild(nameNode)
  nameNode.parent.appendChild(div)
})
