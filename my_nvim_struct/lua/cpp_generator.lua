-- lua/cpp_generator.lua
local M = {} -- Создаем пустой модуль (таблицу)

-- Основная функция, которая делает всю работу
-- name: это строка, которую ты передашь (например, "MyClass")
function M.create_pair(name)
    if not name or name == "" then
        print("Ошибка: Имя класса не указано!")
        return
    end

    -- Формируем имена файлов
    local header_file = name .. ".hpp"
    local source_file = name .. ".cpp"

    -- 1. Создаем .hpp файл
    -- "w" означает write (запись). Если файл есть, он перезапишется!
    local file_h = io.open(header_file, "w") 
    if file_h then
        -- Пишем контент. \n - это перенос строки
        file_h:write("#pragma once\n\n")
        file_h:write("class " .. name .. " {\n")
        file_h:write("    public:\n")
        file_h:write("        " .. name .. "();\n")
        file_h:write("        ~" .. name .. "();\n")
        file_h:write("};\n")
        file_h:close() -- Обязательно закрываем файл
    else
        print("Не удалось создать " .. header_file)
        return
    end

    -- 2. Создаем .cpp файл
    local file_c = io.open(source_file, "w")
    if file_c then
        file_c:write('#include "' .. header_file .. '"\n\n')
        file_c:write(name .. "::" .. name .. "() {\n\n}\n\n")
        file_c:write(name .. "::~" .. name .. "() {\n\n}\n")
        file_c:close()
    else
        print("Не удалось создать " .. source_file)
    end

    print("Успешно созданы: " .. header_file .. " и " .. source_file)
end

-- Эта функция нужна, чтобы создать команду в Neovim (:MakeCppClass)
function M.setup()
    -- Создаем пользовательскую команду
    -- "CppClass" - имя команды, которую ты будешь вводить
    vim.api.nvim_create_user_command("CppClass", function(opts)
        -- opts.args содержит то, что ты ввел после команды
        M.create_pair(opts.args)
    end, { nargs = 1 }) -- nargs = 1 значит, что команда требует ровно 1 аргумент
end

return M -- Возвращаем модуль наружу
