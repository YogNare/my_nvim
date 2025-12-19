-- Автоматическое переключение нумерации
local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

-- Функция для включения относительной нумерации
local function enable_relative()
  if vim.opt.number:get() then
    vim.opt.relativenumber = true
  end
end

-- Функция для отключения относительной нумерации
local function disable_relative()
  if vim.opt.number:get() then
    vim.opt.relativenumber = false
  end
end

-- Включать относительную нумерацию в Normal режиме и при фокусе
vim.api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" },
  {
    pattern = "*",
    group = augroup,
    callback = enable_relative,
  }
)

-- Отключать относительную нумерацию в Insert режиме и при потере фокуса
vim.api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" },
  {
    pattern = "*",
    group = augroup,
    callback = disable_relative,
  }
)
