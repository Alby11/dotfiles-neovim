function OpenOnlineFile()
	local url = vim.fn.input("URL: ")
	if url ~= "" then
		local curl_command = "curl -s " .. url .. " -o /tmp/temp_online_file"
		os.execute(curl_command)
		vim.cmd("e /tmp/temp_online_file")
	else
		print("No URL provided.")
	end
end

Map("n", "<leader>ou", ":lua OpenOnlineFile()<CR>", { noremap = true, silent = true })
