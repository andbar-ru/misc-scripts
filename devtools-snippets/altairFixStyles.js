function altairFixStyle() {
  // Убрать зеленоватый градиент с фона
  document.body.style.backgroundImage = 'none'
  // Убрать номера строк
  const cmGutters = document.getElementsByClassName('cm-gutters')
  for (const elem of cmGutters) {
    elem.style.display = 'none'
  }
}

altairFixStyle()
