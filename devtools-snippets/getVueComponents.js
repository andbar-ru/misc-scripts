function getVueComponents(filter = (v) => true) {
  const vueComponents = []
  const allElems = document.body.getElementsByTagName('*')
  for (const elem of allElems) {
    if (elem.__vue__ && filter(elem.__vue__)) {
      vueComponents.push(elem.__vue__)
    }
  }
  return vueComponents
}


