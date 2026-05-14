-- create files and directories in :Ex
function create_file_folder(is_file)
  if vim.bo.filetype ~= "netrw" then
    print("Not in netrw (:Ex)")
    return
  end

  local dir = vim.fn.expand("%:p:h")
  local name = ""

  if is_file then
    name = vim.fn.input("New file name: ")
  else
    name = vim.fn.input("New directory name: ")
  end

  if name == "" then return end
  local path = dir .. "/" .. name

  if is_file then
      local ok = io.open(path, "w")
      if ok then
        ok:close()
      else
        print("Failed to create file")
        return
      end
  else
     local ok = vim.fn.mkdir(path, "p") 
     if ok == 0 then
        print("Failed to create directory")
        return
     end
  end

  vim.cmd(":Ex")
end

vim.keymap.set("n", "<leader>wf", function()
create_file_folder(true)  
end,{ desc = "Create file in netrw directory" })

vim.keymap.set("n", "<leader>wd", function()
create_file_folder(false)  
end, { desc = "Create directory in netrw" })

