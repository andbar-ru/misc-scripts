function removeTypenames() {
  const appWindow = document.querySelector('app-window:not(.hide)')
  appWindow.querySelectorAll('.cm-property').forEach(node => {
    if (node.textContent === '__typename') {
      const div = node.closest('div')
      div.remove()
    }
  })
}

removeTypenames()
