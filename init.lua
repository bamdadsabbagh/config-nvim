vim.cmd[[set relativenumber]]

local function map(mode, lhs, rhs, opts)
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-----------------
-- Normal mode --
-----------------

-- Buffers
local close_buffer = { command = "<cmd>bdelete<cr>", description = "Close buffer" }
map("n", "<A-x>", close_buffer.command, { desc = close_buffer.description, remap = true })
map("n", "<leader>x", close_buffer.command, { desc = "Close buffer", remap = true })

local write_buffer = { command = "<cmd>w<cr>", description = "Write buffer" }
map("n", "<A-s>", write_buffer.command, { desc = write_buffer.description, remap = true })
map("n", "<leader>s", write_buffer.command, { desc = write_buffer.description, remap = true })

map("n", "<A-S-x>", "<cmd> %bd|e#|bd# <cr>", { desc = "Close all buffers except current", remap = true })

-- Windows management
map("n", "<leader>$", "<C-w>v", { desc = "Split window vertically", remap = true })
map("n", "<leader>*", "<C-w>s", { desc = "Split window horizontally", remap = true })
map("n", "<A-w>", "<C-w>c", { desc = "Close split window", remap = true })
map("n", "<leader>w", "<C-w>c", { desc = "Close split window", remap = true })

-- Windows navigation
map("n", "<A-l>", "<C-w>l", { desc = "Go to right window", remap = true })
map("n", "<A-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<A-k>", "<C-w>k", { desc = "Go to above window", remap = true })
map("n", "<A-j>", "<C-w>j", { desc = "Go to below window", remap = true })

-- Number row for azerty
map("n", "&", "1", { remap = true })
map("n", "é", "2", { remap = true })
map("n", '"', "3", { remap = true })
map("n", "'", "4", { remap = true })
map("n", "(", "5", { remap = true })
map("n", "-", "6", { remap = true })
map("n", "è", "7", { remap = true })
map("n", "_", "8", { remap = true })
map("n", "ç", "9", { remap = true })
map("n", "à", "0", { remap = true })
map("n", ")", "_", { remap = true })

-- Navigation
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Go to next buffer", remap = true })
map("n", "<S-tab>", "<cmd>bprev<cr>", { desc = "Go to prev buffer", remap = true })
map({ "n", "v" }, "<A-d>", "<C-d>zz", { desc = "Move block down", remap = true })
map({ "n", "v" }, "<A-u>", "<C-u>zz", { desc = "Move block up", remap = true })
map("n", "<A-o>", "<C-o>zz", { desc = "Navigate to previous location", remap = true })
map("n", "<A-i>", "<C-i>zz", { desc = "Navigate to next location", remap = true })

-- Search results
map("n", "n", "nzzzv", { desc = "Go to next search result and keep cursor centered", remap = true })
map("n", "N", "Nzzzv", { desc = "Go to previous search result and keep cursor centered", remap = true })

-- Selection
map("n", "<C-a>", "ggVG", { desc = "Select all", remap = true })
map("n", "<C-c>", "<cmd> %y+ <cr>", { desc = "Copy all", remap = true })

-- Find [ ]
map("n", "]T", "<cmd> /\\[ \\] <cr>", { desc = "Find [ ]", remap = true })

-- Motions

-- Delete writes to register `a`
map("n", "d", '"ad', { noremap = true })

-- Backspace writes to black hole register
map({ "n", "v" }, "x", '"_x', { noremap = true })

-- Next word
map("n", "z", "w", { noremap = true })
map("n", "Z", "W", { noremap = true })

-- Cut word
map("n", "cz", "cw", { noremap = true })
map("n", "cZ", "cW", { noremap = true })

-- Cut inside word
map("n", "ciz", "ciw", { noremap = true })
map("n", "ciZ", "ciW", { noremap = true })

-- Delete word
map("n", "dz", '"adw', { noremap = true })
map("n", "dZ", '"adW', { noremap = true })

-- Delete inside word
map("n", "diz", '"adiw', { noremap = true })
map("n", "diZ", '"adiw', { noremap = true })

-- Visualize word
map("n", "vz", "vw", { noremap = true })
map("n", "vZ", "vW", { noremap = true })

-- Visualize inside word
map("n", "viz", "viw", { noremap = true })
map("n", "viZ", "viW", { noremap = true })

-- Paste from register `a`
map({ "n", "v" }, "<leader>p", '"ap', { noremap = true })
map({ "n", "v" }, "<leader>P", '"aP', { noremap = true })

-- Merge
map("n", "J", "mzJ`z", { desc = "Merge next line while maintaining cursor position", remap = true })

-----------------
-- Insert mode --
-----------------

-- General
map("i", "<C-c>", "<esc>", { desc = "Exit insert mode", remap = true })
map("i", "<A-c>", "<esc>", { desc = "Exit insert mode", remap = true })

-- Basic movements
map("i", "<A-h>", "<Left>", { desc = "Move left", remap = true })
map("i", "<A-l>", "<Right>", { desc = "Move right", remap = true })
map("i", "<A-k>", "<Up>", { desc = "Move up", remap = true })
map("i", "<A-j>", "<Down>", { desc = "Move down", remap = true })

-- Motions
map("i", "<A-z>", "<C-w>", { desc = "Delete word", remap = true })

-----------------
-- Visual mode --
-----------------

-- Motions
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual block up", remap = true })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual block down", remap = true })

-- Indentations
-- map("v", "<", ">")
-- map("v", ">", "<")

-------------
-- Plugins --
-------------

-- Renamer
map("n", "<leader>ra", vim.lsp.buf.rename, { desc = "Rename", remap = true })

-- Gitsigns
local gitsigns = {
  next = {
    command = function()
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
    end,
    description = "Go to next hunk",
  },
  previous = {
    command = function()
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
    end,
    description = "Go to previous hunk",
  },
  reset = {
    command = function()
      require("gitsigns").reset_hunk()
    end,
    description = "Reset hunk",
  },
  preview = {
    command = function()
      require("gitsigns").preview_hunk()
    end,
    description = "Preview hunk",
  },
  blame = {
    command = function()
      require("gitsigns").blame_line()
    end,
    description = "Git blame",
  },
}

map("n", "]c", gitsigns.next.command, { desc = gitsigns.next.description, remap = true })
map("n", "[c", gitsigns.previous.command, { desc = gitsigns.previous.description, remap = true })
map("n", "<leader>rh", gitsigns.reset.command, { desc = gitsigns.reset.description, remap = true })
map("n", "<leader>ph", gitsigns.preview.command, { desc = gitsigns.preview.description, remap = true })
map("n", "<leader>gb", gitsigns.blame.command, { desc = gitsigns.blame.description, remap = true })
