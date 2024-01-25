function extractMoves() {
  const tds = document.querySelectorAll('#relatedOpenings td:last-child')
  let text = ''
  for (const td of tds) {
    text += td.textContent + '\n'
  }
  return text
}
