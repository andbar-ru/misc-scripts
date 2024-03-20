function altairClear() {
  const appWindow = document.querySelector('app-window:not(.hide)')
  if (!appWindow) {
    return
  }

  function clearLinesIn(containerClass) {
    const container = appWindow.getElementsByClassName(containerClass)[0]
    if (!container) {
      return
    }
    const lines = container.querySelectorAll('.cm-line')
    lines.forEach((l) => l.remove())
  }

  setTimeout(() => {
    clearLinesIn('query-editor-container')
  }, 100)
  setTimeout(() => {
    clearLinesIn('set-variable-textarea')
  }, 200)
  setTimeout(() => {
    const clearBtn = appWindow.getElementsByClassName('query-result__clear-button')[0]
    if (clearBtn) {
      clearBtn.click()
    }
  }, 300)
}

altairClear()
