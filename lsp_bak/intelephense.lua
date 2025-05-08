return {
    cmd = { "intelephense", "--stdio" },
    root_markers = {
     'composer.json',
      '.git',
      'index.php',
      'artisan',
      'phpunit.xml',
      'phpunit.xml.dist'
    },
    filetypes = {"php"},

  settings = {
    intelephense = {
      files = {
        maxSize = 90000000,
      },
      diagnostics = {
        undefinedTypes = false,
        undefinedFunctions = false,
        undefinedConstants = false,
        undefinedClassConstants = false,
        undefinedMethods = false,
        undefinedProperties = false,
        undefinedVariables = true,
        typeErrors = false,
        unusedSymbols = false,
      }
    },
  },
}
