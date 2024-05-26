local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

if is_windows then
	local aspnet_webforms_file_types = vim.api.nvim_create_augroup("aspnet_webforms", { clear = true})
  vim.o.shell = "powershell"
  vim.o.shellcmdflag = "-command"
  vim.o.shellquote = "\\"
  vim.o.shellxquote = ""

	vim.api.nvim_create_autocmd('BufEnter', {
		pattern = { "*.aspx", "*.ascx", "*.master", "*.Master", "*.asmx", "*.ashx", "*.asax", "*.cshtml", "*.vbhtml" },
		callback = function() vim.bo.filetype = "html" end,
		group = aspnet_webforms_file_types
	})
end
