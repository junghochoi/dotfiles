local M = {}
--- Gets the current file's directory path relative to the 'google3' directory
--- and copies it to the system clipboard, starting with '//'.
function M.copy_google3_path()
  -- Get the absolute path of the containing directory (:p:h)
  local full_dir_path = vim.fn.expand('%:p:h')

  if full_dir_path == "" then
    print("No file loaded in the current buffer.")
    return
  end

  -- 1. Search for the index where 'google3/' ends
  -- We use a pattern that captures the 'google3/' part to ensure we start AFTER it.
  local _, end_index = string.find(full_dir_path, "google3/")

  if not end_index then
    -- Handle the error if 'google3' is not found in the path
    print("🛑 Error: File is not within a 'google3' directory structure.")
    return
  end

  -- 2. Extract the relative path segment starting AFTER 'google3/'
  -- string.sub starts from (end_index + 1) to omit the 'google3/' prefix
  local relative_path = string.sub(full_dir_path, end_index + 1)

  -- 3. Prepend the desired '//' prefix
  local final_path = "//" .. relative_path

  -- 4. Copy the path to the '+' register (system clipboard).
  vim.fn.setreg('+', final_path, 'c')

  -- 5. Print a confirmation message.
  print("✅ Copied google3 directory path: " .. final_path)
end

return M
