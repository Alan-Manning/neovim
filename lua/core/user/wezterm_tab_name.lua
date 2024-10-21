local function strSplit(delim, str)
  local t = {}
  for substr in string.gmatch(str, "[^" .. delim .. "]*") do
    if substr ~= nil and string.len(substr) > 0 then
      table.insert(t, substr)
    end
  end
  return t
end

local function check_in_git_repo()
  local path = vim.loop.cwd() .. "/.git"
  local _, err = vim.loop.fs_stat(path)
  if err then
    return false
  end
  return true
end

local function get_branch_name()
  local get_git_branch_name_cmd = "git branch --show-current"
  local branch = vim.fn.system(get_git_branch_name_cmd)
  branch = branch:gsub("[\n\r]", " ")
  return " " .. branch .. "|"
end

local function get_repo_name()
  local get_git_repo_name_cmd = "Split-Path -Leaf (git remote get-url origin | Split-Path -leaf).split('.')[0]"
  local repo_name = vim.fn.system(get_git_repo_name_cmd)

  repo_name = repo_name:gsub("[\n\r]", "")
  if string.find("error", repo_name) ~= nil then
    return ""
  end

  if repo_name == nil then
    return ""
  else
    return " " .. repo_name .. " |"
  end
end

local function get_current_dir_name()
  local dirs = strSplit("\\", vim.fn.getcwd())
  local current_dir_name = dirs[#dirs]
  return " " .. current_dir_name
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    -- local current_tab_title = vim.fn.system({ "wezterm", "cli", "get-tab-title", "" }) trying to get the current tab name to maintin numbering in tab titles.
    -- print(current_tab_title)

    local tab_text = " |"
    local in_git = check_in_git_repo()

    if in_git then
      tab_text = tab_text .. get_branch_name()
      tab_text = tab_text .. get_repo_name()
    end

    tab_text = tab_text .. get_current_dir_name()

    vim.fn.system({ "wezterm", "cli", "set-tab-title", tab_text })
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    -- Setting title to empty string causes wezterm to revert to its
    -- default behavior of setting the tab title automatically
    vim.fn.system({ "wezterm", "cli", "set-tab-title", "" })
  end,
})
