-- Nicholas J Uhlhorn
-- April 2024

vim.opt.autoindent	= true			    -- indent new lines the same amount as last line.
vim.opt.breakindent = true              -- indents wraped text to same as parent line.
-- vim.opt.cc=88				        -- set color columns for good coding style.
vim.opt.expandtab	= true		    	-- convert tabs to white space (industry std.)
-- vim.opt.filetype	='plugin indent on'	-- allows auto-indenting depending on file type.
vim.opt.hlsearch	= false			    -- highlight search results.
vim.opt.ignorecase	= true			    -- case insensitve matching.
vim.opt.number		= true			    -- add line numbers.
--vim.opt.setmouse	='v'			    -- middle click paste.
vim.opt.shiftwidth	= 4			        -- width for autoindents.
vim.opt.showbreak   = string.rep(' ', 3)-- make it so long lines wrap smartly
vim.opt.showmatch 	= true			    -- show matching brackets.
vim.opt.smartcase   = true              -- case sensitive when using capitals in search
vim.opt.softtabstop	= 4			        -- see multiple spaces as tabstops so <BS> does the right thing.
vim.opt.tabstop		= 4		        	-- sets columns per tab.
vim.opt.wildmode	='longest,list'		-- get bash-like tab completions.
vim.opt.wrap        = true              -- sets if text past screen width is visible.
