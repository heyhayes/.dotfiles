local floatingTerms = {
  lazygit = {
    floating = {
      buf = -1,
      win = -1
    },
    job_id = -1
  },
  terminal = {
    floating = {
      buf = -1,
      win = -1
    },
    job_id = -1
  }
}

local function create_floating_window(opts)
  opts = opts or {}

  -- Get the total dimensions of the editor
  local total_cols = vim.o.columns
  local total_lines = vim.o.lines

  -- Calculate the desired width and height
  local win_width = opts.width or math.floor(total_cols * 0.8)
  local win_height = opts.height or math.floor(total_lines * 0.8)

  -- Center the window by calculating the starting row and column
  local row = math.floor((total_lines - win_height) / 2)
  local col = math.floor((total_cols - win_width) / 2)

  -- Create a new buffer (not listed and scratch buffer)
  local buf = nil
  if not vim.api.nvim_buf_is_valid(opts.buf) then
    buf = vim.api.nvim_create_buf(false, true)
  else
    buf = opts.buf
  end

  -- Open a new floating window with the specified dimensions and position.
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    row = row,
    col = col,
    width = win_width,
    height = win_height,
    style = 'minimal',
    border = 'none',
  })

  return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("LazyGit", function()
  if not vim.api.nvim_win_is_valid(floatingTerms.lazygit.floating.win) then
    floatingTerms.lazygit.floating = create_floating_window { buf = floatingTerms.lazygit.floating.buf }
    if vim.bo[floatingTerms.lazygit.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
      floatingTerms.lazygit.job_id = vim.bo[floatingTerms.lazygit.floating.buf].channel
      vim.api.nvim_chan_send(floatingTerms.lazygit.job_id, "lazygit\r\n")
      vim.cmd("startinsert")
      vim.keymap.set("t", "q", function()
        vim.api.nvim_buf_delete(floatingTerms.lazygit.floating.buf, { force = true })
        floatingTerms.lazygit.floating.buf = -1
      end)
    end
  else
    vim.api.nvim_win_hide(floatingTerms.lazygit.floating.win)
  end
end, {})

vim.api.nvim_create_user_command("Floaterm", function()
  if not vim.api.nvim_win_is_valid(floatingTerms.terminal.floating.win) then
    floatingTerms.terminal.floating = create_floating_window { buf = floatingTerms.terminal.floating.buf }
    if vim.bo[floatingTerms.terminal.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
      vim.cmd("startinsert")
    end
  else
    vim.api.nvim_win_hide(floatingTerms.terminal.floating.win)
  end
end, {})
