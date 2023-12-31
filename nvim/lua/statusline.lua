-- Inspiration from: https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

local icons = require("nvim-web-devicons")

local function icon()
  local icon = icons.get_icon_by_filetype(vim.bo.filetype)
  if icon == nil then
    return ""
  end

  return " " .. icon .. " "
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
    return ""
  end
  return fname .. "  "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " " .. count["errors"] .. " "
  end
  if count["warnings"] ~= 0 then
    warnings = " " .. count["warnings"] .. " "
  end
  if count["hints"] ~= 0 then
    hints = " " .. count["hints"] .. " "
  end
  if count["info"] ~= 0 then
    info = " " .. count["info"] .. " "
  end

  local status = errors .. warnings .. hints .. info
  if status ~= "" then
    return status .. " "
  else
    return ""
  end

end

local function filetype()
  return string.format(" %s ", vim.bo.filetype):upper()
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %l:%c "
end

local function vcs()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then 
    return ""
  end

  local change_icon = ""
  local lines_changed = git_info.added + git_info.removed + git_info.changed
  if lines_changed ~= 0 then
    change_icon = "  "
  end

  return "" .. git_info.head .. change_icon .. "  "
end

Statusline = {}

Statusline.active = function()
  return table.concat {
    "%#Statusline#",
    icon(),
    filepath(),
    filename(),
    vcs(),
    lsp(),
    "%=",
    filetype(),
    lineinfo(),
  }
end

function Statusline.inactive()
  return "%#NORMAL# %F"
end

function Statusline.short()
  return "%#StatusLineNC#   Neo Tree"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter * if &filetype == "neo-tree" | setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)


