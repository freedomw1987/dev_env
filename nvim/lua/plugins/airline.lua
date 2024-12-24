return {
  "vim-airline/vim-airline",
  dependencies = {
		"vim-airline/vim-airline-themes",
	},
	config = function()
	  vim.g['airline#extensions#tabline#enabled'] = 1
	  vim.g['airline#extensions#tabline#show_buffers'] = 0
	  vim.g['airline#extensions#tabline#show_tabs'] = 1
	  vim.g['airline#extensions#tabline#tab_nr_type'] = 1
	  vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'
	  vim.g['airline_theme'] = 'catppuccin'

	end
	
}
