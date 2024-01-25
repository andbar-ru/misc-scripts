function getStyleTop(el) {
  const top = parseInt(el.style.top)
  if (!Number.isFinite(top)) {
    return 0
  }
  return top
}

function fixPanes() {
  const topIncrement = 35

  const appWindow = document.querySelector('app-window:not(.hide)')
  const appQueryEditor = appWindow.querySelector('app-query-editor')
  appQueryEditor.style.top = getStyleTop(appQueryEditor) + topIncrement + 'px'
  const appDocViewer = appWindow.querySelector('app-doc-viewer')
  appDocViewer.style.top = getStyleTop(appDocViewer) + topIncrement + 'px'
  const appQueryResult = appWindow.querySelector('app-query-result')
  appQueryResult.style.top = getStyleTop(appQueryResult) + topIncrement + 'px'
}

fixPanes()
