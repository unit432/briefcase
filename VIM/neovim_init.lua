-- === PaperColor ===                                                                                   
vim.o.termguicolors = true       -- Enable 24-bit RGB color in the terminal (for PaperColor theme)      
vim.o.background = 'light'       -- Set background to light for PaperColor theme                        
-- vim.cmd('colorscheme PaperColor') -- Apply PaperColor theme                                          
                                                                                                        
-- Highlight search results, cursor column, and cursor line                                             
vim.o.hlsearch = true            -- Highlight search results                                            
vim.o.cursorcolumn = true        -- Highlight the current column where the cursor is                    
vim.o.cursorline = true          -- Highlight the current line where the cursor is                      
                                                                                                        
-- Custom highlight for cursor column and line                                                          
vim.cmd('highlight CursorColumn guibg=#EDEDED cterm=NONE term=NONE')                                    
vim.cmd('highlight Cursorline guibg=#404040 cterm=NONE term=NONE')                                      
                                                                                                        
-- Show line numbers                                                                                    
vim.o.number = true              -- Show line numbers                                                   
                                                                                                        
-- Encoding                                                                                             
vim.o.encoding = 'utf-8'         -- Set file encoding to UTF-8                                          
                                                                                                        
-- Whitespace settings                                                                                  
vim.o.backspace = 'indent,eol,start'  -- Configure backspace behavior                                   
vim.o.autoindent = true              -- Enable auto-indentation                                         
vim.o.shiftwidth = 2                 -- Set number of spaces for indentation                            
vim.o.softtabstop = 2               -- Set number of spaces for a tab                                   
vim.o.expandtab = true              -- Use spaces instead of tabs                                       
                                                                                                        
-- Show line numbers again (redundant, but included as per your config)                                 
vim.o.number = true                -- Show line numbers again (redundant, can be omitted)               
                                                                                                        
                                                                                                        
-- Lazy.nvim Bootstrap                                                                                  
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
vim.opt.rtp:prepend(lazypath)                                                                           
