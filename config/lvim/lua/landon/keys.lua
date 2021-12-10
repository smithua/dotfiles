local actions = require("telescope.actions")

-- Set the leader.
lvim.leader = "space"

-- Prevent the cursor from jumping when joining lines
lvim.keys.normal_mode["J"] = "mzJ`z"

-- Make Y's behavior match D and C
lvim.keys.normal_mode["Y"] = "y$"

-- Make the default navigation keys respect wrapped lines.
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["0"] = "g0"
lvim.keys.normal_mode["^"] = "g^"
lvim.keys.normal_mode["$"] = "g$"

-- Add mappings for commenting.
lvim.builtin.comment.create_mappings = false
lvim.keys.normal_mode["gc"] = ":CommentToggle<cr>"
lvim.keys.visual_mode["gc"] = ":CommentToggle<cr>"

-- Alias the Eunuch commands (expect for Move and Wall)
vim.cmd('cabbrev remove <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Delete" : "remove"<cr>')
vim.cmd('cabbrev delete <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Delete" : "delete"<cr>')
vim.cmd('cabbrev unlink <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Unlink" : "unlink"<cr>')
vim.cmd('cabbrev rename <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Rename" : "rename"<cr>')
vim.cmd('cabbrev chmod <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Chmod" : "chmod"<cr>')
vim.cmd('cabbrev mkdir <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Mkdir" : "mkdir"<cr>')
vim.cmd('cabbrev find <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Find" : "find"<cr>')
vim.cmd('cabbrev locate <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Locate" : "locate"<cr>')
vim.cmd(
  'cabbrev sudowrite <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Sudowrite" : "sudowrite"<cr>'
)
vim.cmd(
  'cabbrev sudoedit <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Sudoedit" : "sudoedit"<cr>'
)

-- Use the up arrow key to trigger a search through history.
lvim.keys.normal_mode["<up>"] = ":<up>"

-- Create more convenient shortcuts for yanking to the system keyboard and pasting from the system
-- keyboard.
lvim.keys.normal_mode["gy"] = '"*y'
lvim.keys.normal_mode["gp"] = '"*p'
lvim.keys.normal_mode["gY"] = '"*y$'
lvim.keys.visual_mode["gy"] = '"*y'
lvim.keys.visual_mode["gp"] = '"*p'
lvim.keys.visual_block_mode["gy"] = '"*y'
lvim.keys.visual_block_mode["gp"] = '"*p'

-- Disable Ex mode
lvim.keys.normal_mode["Q"] = "<nop>"
lvim.keys.normal_mode["gQ"] = "<nop>"

-- Use double escape to clear the highlights.
lvim.keys.normal_mode["<esc>"] = ":nohlsearch<cr>"

-- Change Telescope navigation to use <C-j> and <C-k> for navigation, as well as disabling "normal
-- mode".
-- TODO: Downcase these mappings once this issue is fixed: https://bit.ly/3AaQxfd.

lvim.builtin.telescope.defaults.mappings = {
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<down>"] = actions.move_selection_next,
    ["<up>"] = actions.move_selection_previous,
    ["<esc>"] = actions.close,
  },
}

-- Configure which-key to only open for the leader or if the ? key is pressed.
lvim.builtin.which_key.setup.triggers = { "<leader>" }
lvim.keys.normal_mode["?"] = ":WhichKey<cr>"

-- Configure hop.
vim.api.nvim_set_keymap("n", "\\", ":HopWord<cr>", { silent = true })

-- Disable the annoying block visual mode keymappings.
lvim.keys.visual_block_mode["J"] = ""
lvim.keys.visual_block_mode["K"] = ""

-- Remap :wq and :q to close buffers instead of windows.
vim.cmd("cnoreabbrev wq w<bar>bd")
vim.cmd("cnoreabbrev q bd")

-- Add handy buffer keymappings.
lvim.keys.normal_mode["<leader>bo"] = "<cmd>lua require('utilities.buffer_only').buffer_only()<cr>"
lvim.keys.normal_mode["<leader>bmn"] = ":BufferLineMoveNext<cr>"
lvim.keys.normal_mode["<leader>bmp"] = ":BufferLineMovePrev<cr>"