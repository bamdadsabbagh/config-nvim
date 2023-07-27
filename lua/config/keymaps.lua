local map = require("utils.map")

-----------------
-- Normal mode --
-----------------

-- General
map("n", "<leader>o", "<cmd>echo 'test'<cr>", { desc = "Echo test", remap = true })

local close_buffer = { command = "<cmd>bdelete<cr>", description = "Close buffer" }
map("n", "<A-w>", close_buffer.command, { desc = close_buffer.description, remap = true })
map("n", "<A-x>", close_buffer.command, { desc = close_buffer.description, remap = true })
map("n", "<leader>x", close_buffer.command, { desc = "Close buffer", remap = true })

local write_buffer = { command = "<cmd>w<cr>", description = "Write buffer" }
map("n", "<A-s>", write_buffer.command, { desc = write_buffer.description, remap = true })
map("n", "<leader>s", write_buffer.command, { desc = write_buffer.description, remap = true })

-- Navigation
map("n", "à", "0", { desc = "Go to beginning of line", remap = true })
map("n", "<A-d>", "<C-d>zz", { desc = "Move block down", remap = true })
map("n", "<A-u>", "<C-u>zz", { desc = "Move block up", remap = true })
map("n", "<A-o>", "<C-o>zz", { desc = "Navigate to previous location", remap = true })
map("n", "<A-i>", "<C-i>zz", { desc = "Navigate to next location", remap = true })

-- Azerty: bind `z` to `w`
-- Motion
map("n", "z", "w", { remap = true })
map("n", "Z", "W", { remap = true })

-- Cut word
map("n", "cz", "cw", { remap = true })
map("n", "cZ", "cW", { remap = true })

-- Cut inside word
map("n", "ciz", "ciw", { remap = true })
map("n", "ciZ", "ciW", { remap = true })

-- Delete word
map("n", "dz", "dw", { remap = true })
map("n", "dZ", "dW", { remap = true })

-- Visualize word
map("n", "vz", "vw", { remap = true })
map("n", "vZ", "vW", { remap = true })

-- Visualize inside word
map("n", "viz", "viw", { remap = true })
map("n", "viZ", "viW", { remap = true })

-- Motions
map("n", "J", "mzJ`z", { desc = "Merge next line while maintaining cursor position", remap = true })

-----------------
-- Insert mode --
-----------------

-- Motions
map("i", "<A-z>", "<C-w>", { desc = "Delete word", remap = true })

-----------------
-- Visual mode --
-----------------

-- Motions
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual block up", remap = true })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual block down", remap = true })