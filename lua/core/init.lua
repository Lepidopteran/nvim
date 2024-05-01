local vim = vim
local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

opt.rtp:prepend(lazypath)
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 0
opt.expandtab = false
opt.smartindent = true
