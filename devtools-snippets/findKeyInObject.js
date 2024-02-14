function findKeyInObject(obj, key) {
  const results = new Map()
  const visited = new Set()

  function dfs(obj, key, results, path) {
    if (visited.has(obj)) {
      return
    }
    visited.add(obj)

    if (Object.keys(obj).includes(key)) {
      results.set(path + '.' + key, obj[key])
    }
    for (const [k, v] of Object.entries(obj)) {
      if (v instanceof Object) {
        dfs(v, key, results, path + '.' + k)
      }
    }
  }

  dfs(obj, key, results, '')

  return results
}
