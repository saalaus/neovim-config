local m = {}

local function clear_backspace(str)
    str = str:gsub("%s+", "")
    str = str.gsub(str, "%s+", "")
    return str
end

m.get_popen = function(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return clear_backspace(result)
end

local function filter(arr, func)
    -- Filter in place
    -- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
    local new_index = 1
    local size_orig = #arr
    for old_index, v in ipairs(arr) do
        if func(v, old_index) then
            arr[new_index] = v
            new_index = new_index + 1
        end
    end
    for i = new_index, size_orig do arr[i] = nil end
end

local function pyright_accessed_filter(diagnostic)
    -- Allow kwargs to be unused, sometimes you want many functions to take the
    -- same arguments but you don't use all the arguments in all the functions,
    -- so kwargs is used to suck up all the extras
    -- if diagnostic.message == '"kwargs" is not accessed' then
    -- 	return false
    -- end
    --
    -- Allow variables starting with an underscore
    -- if string.match(diagnostic.message, '"_.+" is not accessed') then
    -- 	return false
    -- end


    -- For all messages "is not accessed"
    if string.match(diagnostic.message, '".+" is not accessed') then
        return false
    end

    return true
end

m.custom_on_publish_diagnostics = function(a, params, client_id, c, config)
    filter(params.diagnostics, pyright_accessed_filter)
    vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end


-- lsp diagnostic buffer nrs
local diagnostics_buffer = {}

-- toggle diagnostics list
m.ToggleDiagnosticsList = function()
    local current_buf = vim.api.nvim_get_current_buf()

    if not diagnostics_buffer[current_buf] then
        vim.diagnostic.setloclist()
        diagnostics_buffer[current_buf] = vim.api.nvim_get_current_buf()
    else
        vim.api.nvim_buf_delete(diagnostics_buffer[current_buf], {})
        diagnostics_buffer[current_buf] = nil
    end
end


local function get_gitignore(args)
    local data = m.get_popen("curl " .. "https://www.toptal.com/developers/gitignore/api/" .. args.args)
    -- print(vim.inspect(data))
    vim.api.nvim_buf_set_current_line(data)
end

m.new_project = function()
    vim.ui.select({ "Empty folder", "poetry", "npm" }, { prompt = "Select type project" },
        function(item)
            vim.ui.input("Project name: ", function(input_item)
                if input_item == nil then
                    return
                end
                if item == "poetry" then
                    m.get_popen("poetry new " .. input_item)
                    vim.cmd("cd " .. input_item)
                    vim.cmd("edit " .. "pyproject.toml")
                    vim.notify("Create poetry project " .. input_item)
                end
                if item == "Empty folder" then
                    vim.loop.fs_mkdir(vim.fn.getcwd() .. "/" .. input_item, 493)
                    vim.cmd("cd " .. input_item)
                    vim.notify("Create empty folder " .. input_item)
                end
                vim.cmd [[ WorkspacesAdd ]]
            end)
        end)
end

vim.api.nvim_create_user_command("Gitignore", get_gitignore, { nargs = 1 })

return m
