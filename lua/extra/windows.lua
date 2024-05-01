local aspnet_webforms_file_types = vim.api.nvim_create_augroup("aspnet_webforms", { clear = true})
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { "*.aspx", "*.ascx", "*.master", "*.Master", "*.asmx", "*.ashx", "*.asax", "*.cshtml", "*.vbhtml" },
  callback = function() vim.bo.filetype = "html" end,
  group = aspnet_webforms_file_types
})

if is_windows then
  vim.o.shell = "pwsh"
  vim.o.shellcmdflag = "-command"
  vim.o.shellquote = "\\"
  vim.o.shellxquote = ""
end
