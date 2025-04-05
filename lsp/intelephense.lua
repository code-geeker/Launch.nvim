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
    },
  },
}
