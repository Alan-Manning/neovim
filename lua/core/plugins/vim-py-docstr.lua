return {
  "pixelneo/vim-python-docstring",
	ft = { "python" },
  config = function()
    --setting the python docstring format to numpy
    vim.g.python_style = 'numpy'
  end
}
