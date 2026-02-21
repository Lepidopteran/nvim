local Package = require("mason-core.package")
local registry = require("mason-registry")
local title = "Tool Installer"

registry.refresh(function()
	for _, tool in pairs(require("configs.tools")) do
		local package_name, version = Package.Parse(tool)
		local ok, pkg = pcall(registry.get_package, package_name)

		if ok then
			local package_version = pkg:get_installed_version()
			local package_latest = pkg:get_latest_version()

			if
				pkg:is_installed()
				and (version == nil or package_version == version or package_version == package_latest)
			then
				goto continue
			end

			vim.notify(("Installing %q"):format(tool), vim.log.levels.INFO, { title = title })
			pkg:install({ version = version }, function()
				vim.notify(("Successfully Installed %q"):format(tool), vim.log.levels.INFO, { title = title })
			end)
		else
			vim.notify(("%q is not in any mason registry"):format(tool), vim.log.levels.ERROR, { title = title })
		end

		::continue::
	end
end)
