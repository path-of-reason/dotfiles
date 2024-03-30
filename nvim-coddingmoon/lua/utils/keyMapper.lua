-- 키 매핑 함수 만들기
local keyMapper = function(from, to, mode, opts)
  local options = { noremap = true, silent = true }
  mode = mode or "n"

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, from, to, options)
end

-- 익스포트
return { mapKey = keyMapper }
