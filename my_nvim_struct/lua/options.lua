require "nvchad.options"

local opt = vim.opt

-- Относительная нумерация строк
opt.number = true         -- Показывать номер текущей строки
opt.relativenumber = true -- Показывать относительные номера для остальных строк

-- Дополнительные полезные настройки
opt.numberwidth = 4       -- Ширина колонки с номерами
opt.signcolumn = "yes"    -- Всегда показывать колонку для знаков (LSP, git и т.д.)
