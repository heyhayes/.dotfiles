vim.g.projectionist_heuristics = {
  artisan = {
    ["*"] = {
      start = "php artisan serve",
      console = "php artisan tinker",
    },
    ["app/*.php"] = {
      type = "source",
      alternate = {
        "tests/Feature/{}Test.php",
      },
    },
    ["tests/Feature/*Test.php"] = {
      type = "test",
      alternate = {
        "app/{}.php",
      },
    },
    ["app/**/Models/*.php"] = {
      type = "model",
    },
  },
}
