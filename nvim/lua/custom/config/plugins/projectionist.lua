vim.g.projectionist_heuristics = {
  artisan = {
    ["*"] = {
      start = "composer run dev",
      console = "php artisan tinker",
    },
  },
}
