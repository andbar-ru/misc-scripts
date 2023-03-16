const fs = require('fs')

const filePath = process.argv[2]
const arrayKey = process.argv[3]
const reverse = process.argv[4] === 'true'
const sortKey = process.argv[5]

if (!filePath || !arrayKey) {
  throw new Error('Expected from 2 to 4 arguments arguments')
}

const data = JSON.parse(fs.readFileSync(filePath))

function compareFn(a, b) {
  if (sortKey) {
    a = a[sortKey]
    b = b[sortKey]
  }
  if (a < b) {
    return reverse ? 1 : -1
  } else if (a > b) {
    return reverse ? -1 : 1
  }
  return 0
}

function walk(obj, name) {
  if (Array.isArray(obj)) {
    if (name === arrayKey) {
      obj.sort(compareFn)
    }
    for (const item of obj) {
      walk(item, null)
    }
  } else if (obj instanceof Object) {
    for (const [key, value] of Object.entries(obj)) {
      walk(value, key)
    }
  }
}

walk(data)

fs.writeFileSync(filePath, JSON.stringify(data, null, '  '))
