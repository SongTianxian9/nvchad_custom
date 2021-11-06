-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad
require "custom.vimrc"

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

-- hooks.add("setup_mappings", function(map)
--    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--    .... many more mappings ....
-- end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
   -- use {
   --    "max397574/better-escape.nvim",
   --    event = "InsertEnter",
   -- },
   --
   --
    -- LANG: markdown
    use {
        'plasticboy/vim-markdown',
        requires = {'godlygeek/tabular'},
        ft = 'markdown',
    }

    use {
        'iamcco/markdown-preview.nvim', 
        run = 'cd app && yarn install', 
        ft = 'markdown',
        config = function()
            vim.cmd([[
            let g:mkdp_auto_start = 1
            let g:mkdp_browser = 'firefox'
            let g:mkdp_echo_preview_url = 1
            let g:mkdp_port = '2929'
            let g:mkdp_page_title = '「${name}」'
            ]])
        end
    }
   

   -- LANG: latex
    use {
    'lervag/vimtex',
    ft = {'tex', 'latex'},
    config = function()
        vim.cmd([[
            let g:tex_flavor='latex'
            let g:vimtex_view_method='skim'
            " let g:vimtex_quickfix_mode=0
            " set conceallevel=1
            " let g:tex_conceal='abdmg'

            function! g:SongTianxiang_write_server_name() abort
              let nvim_server_file = '/tmp/vimtexserver.txt'
              call writefile([v:servername], nvim_server_file)
            endfunction

            augroup vimtex_common
              autocmd!
              autocmd FileType tex call g:SongTianxiang_write_server_name()
            augroup END
        ]])
    end
    }

    use {
    'KeitaNakamura/tex-conceal.vim',
    ft = {'tex', 'latex'},
    config = function()
        vim.cmd([[
            set conceallevel=1
            let g:tex_conceal='abdmg'
            hi Conceal ctermbg=none
        ]])
    end
    }

   -- LANG: racket, scheme
   -- use {
   --      'wlangstroth/vim-racket',
   --      ft = {'racket', 'scheme', 'simply-scheme' },
   -- }
    use {
        'Olical/conjure',
        requires = {'SongTianxian9/vim-racket'},
        ft = {'racket', 'scheme', },
        config = function()
            vim.cmd([[
                let g:conjure#filetype#scheme="conjure.client.racket.stdio"
                let g:conjure#filetype_suffixes#racket=["rkt","scm"]
                let g:conjure#filetype_suffixes#scheme=v:null
            ]])
        end
    }

    -- LANG: python3
        -- The latest version of the command-line tool can be installed with npm, which is part of node. If you don't have a recent version of node on your system, install that first from nodejs.org.
        -- To install pyright globally: npm install -g pyright
        -- On MacOS or Linux, sudo is required to install globally: sudo npm install -g pyright
        -- Once installed, you can run the tool from the command line as follows: pyright <options>
        -- To update to the latest version: sudo npm update -g pyright
    use {
        'python-mode/python-mode',
        ft = 'python',
        branch = 'develop',
    }

   

    -- SNIPPETS
    use {
        'SirVer/ultisnips',
        event = 'VimEnter',
        requires = { 'honza/vim-snippets' },
        ft = {'latex', 'tex', 'markdown'},
        config = function()
            vim.cmd([[
                let g:UltiSnipsExpandTrigger = '<tab>'
                let g:UltiSnipsJumpForwardTrigger = '<tab>'
                let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
                let g:UltiSnipsSnippetDirectories=["UltiSnips", "stx_snippets"]
            ]])
        end
    }

    -- use {
    --     'rlue/vim-barbaric',
    --     event = 'VimEnter',
    --     run = 'curl -o /usr/local/bin/xkbswitch https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch',
    -- }


   

   -- auto change input methods (chinese and english for me), MAC_ONLY
    use {
        'ybian/smartim',
        event = 'VimEnter',
    }


    -- Clean and elegant distraction-free writing for NeoVim
    use {
        "Pocco81/TrueZen.nvim",
        cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
        },
        config = function()
          -- check https://github.com/Pocco81/TrueZen.nvim#setup-configuration (init.lua version)
        end
    }

    use {
        "karb94/neoscroll.nvim",
        opt = true,
        config = function()
          require("neoscroll").setup()
        end,

        -- lazy loading
        setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
        end,
    }

    use {
        'vim-airline/vim-airline',
        requires = {'SongTianxian9/vim-airline-themes', branch = 'stx',},
        config = function()
            vim.cmd([[
                let g:airline_theme='kalisi'
                let g:airline#extensions#tabline#enabled = 1
                let g:airline#extensions#tabline#formatter = 'unique_tail'
            ]])
        end
    }


--     use {
--         'itchyny/lightline.vim',
-- 
--     }

end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with
