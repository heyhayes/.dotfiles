return {
  "https://github.com/vim-test/vim-test",
  dependencies = { "voldikss/vim-floaterm" },
  config = function()
    local set = vim.keymap.set

    set("n", "<leader>tn", ":TestNearest<CR>")
    set("n", "<leader>tf", ":TestFile<CR>")
    set("n", "<leader>ts", ":TestSuite<CR>")
    set("n", "<leader>tl", ":TestLast<CR>")
    set("n", "<leader>tv", ":TestVisit<CR>")

    -- custom strategy for composer
    vim.cmd([[
      function! PestTransform(cmd) abort
        return join(map(split(a:cmd), ''))
      endfunction

      let g:test#custom_transformations = {'pest': function('PestTransform')}
      let g:test#transformation = 'pest'

      " let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '-v'
      let test#javascript#jest#options = '--color'

      function! FloatermStrategy(cmd)
        execute 'silent FloatermSend q'
        execute 'silent FloatermKill'
        execute 'FloatermNew! '.a:cmd.' | less -X'
      endfunction

      let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
      let g:test#strategy = 'floaterm'
    ]])
  end,
}
