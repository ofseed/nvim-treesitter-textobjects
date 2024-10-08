vim.opt.runtimepath:append "."
vim.cmd.runtime { "plugin/query_predicates.lua", bang = true }

require("nvim-treesitter-textobjects").setup {
  select = {
    lookahead = true,
    include_surrounding_whitespace = false,
    selection_modes = {
      ["@function.outer"] = "V", -- linewise
    },
  },
  move = {
    set_jumps = true,
  },
}

local select = require "nvim-treesitter-textobjects.select"
for _, mode in ipairs { "x", "o" } do
  vim.keymap.set(mode, "am", function()
    select.select_textobject("@function.outer", "textobjects")
  end)
  vim.keymap.set(mode, "im", function()
    select.select_textobject("@function.inner", "textobjects")
  end)
  vim.keymap.set(mode, "al", function()
    select.select_textobject("@class.outer", "textobjects")
  end)
  vim.keymap.set(mode, "il", function()
    select.select_textobject("@class.inner", "textobjects")
  end)
  vim.keymap.set(mode, "ab", function()
    select.select_textobject("@block.outer", "textobjects")
  end)
  vim.keymap.set(mode, "ib", function()
    select.select_textobject("@block.inner", "textobjects")
  end)
  vim.keymap.set(mode, "ad", function()
    select.select_textobject("@conditional.outer", "textobjects")
  end)
  vim.keymap.set(mode, "id", function()
    select.select_textobject("@conditional.inner", "textobjects")
  end)
  vim.keymap.set(mode, "ao", function()
    select.select_textobject("@loop.outer", "textobjects")
  end)
  vim.keymap.set(mode, "io", function()
    select.select_textobject("@loop.inner", "textobjects")
  end)
  vim.keymap.set(mode, "aa", function()
    select.select_textobject("@parameter.outer", "textobjects")
  end)
  vim.keymap.set(mode, "ia", function()
    select.select_textobject("@parameter.inner", "textobjects")
  end)
  vim.keymap.set(mode, "af", function()
    select.select_textobject("@call.outer", "textobjects")
  end)
  vim.keymap.set(mode, "if", function()
    select.select_textobject("@call.inner", "textobjects")
  end)
  vim.keymap.set(mode, "ac", function()
    select.select_textobject("@comment.outer", "textobjects")
  end)
  vim.keymap.set(mode, "ar", function()
    select.select_textobject("@frame.outer", "textobjects")
  end)
  vim.keymap.set(mode, "ir", function()
    select.select_textobject("@frame.inner", "textobjects")
  end)
  vim.keymap.set(mode, "at", function()
    select.select_textobject("@attribute.outer", "textobjects")
  end)
  vim.keymap.set(mode, "it", function()
    select.select_textobject("@attribute.inner", "textobjects")
  end)
  vim.keymap.set(mode, "ae", function()
    select.select_textobject("@scopename.inner", "textobjects")
  end)
  vim.keymap.set(mode, "ie", function()
    select.select_textobject("@scopename.inner", "textobjects")
  end)
  vim.keymap.set(mode, "as", function()
    select.select_textobject("@statement.outer", "textobjects")
  end)
  vim.keymap.set(mode, "is", function()
    select.select_textobject("@statement.outer", "textobjects")
  end)
end

-- swap
local swap = require "nvim-treesitter-textobjects.swap"

vim.keymap.set("n", ")m", function()
  swap.swap_next "@function.outer"
end)
vim.keymap.set("n", ")c", function()
  swap.swap_next "@comment.outer"
end)
vim.keymap.set("n", ")a", function()
  swap.swap_next "@parameter.inner"
end)
vim.keymap.set("n", ")b", function()
  swap.swap_next "@block.outer"
end)
vim.keymap.set("n", ")C", function()
  swap.swap_next "@class.outer"
end)

vim.keymap.set("n", "(m", function()
  swap.swap_previous "@function.outer"
end)
vim.keymap.set("n", "(c", function()
  swap.swap_previous "@comment.outer"
end)
vim.keymap.set("n", "(a", function()
  swap.swap_previous "@parameter.inner"
end)
vim.keymap.set("n", "(b", function()
  swap.swap_previous "@block.outer"
end)
vim.keymap.set("n", "(C", function()
  swap.swap_previous "@class.outer"
end)

-- move
local move = require "nvim-treesitter-textobjects.move"
vim.keymap.set({ "n", "x", "o" }, "]m", function()
  move.goto_next_start "@function.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]f", function()
  move.goto_next_start "@call.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]d", function()
  move.goto_next_start "@conditional.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]o", function()
  move.goto_next_start "@loop.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]s", function()
  move.goto_next_start "@statement.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]a", function()
  move.goto_next_start "@parameter.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]c", function()
  move.goto_next_start "@comment.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]b", function()
  move.goto_next_start "@block.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]l", function()
  move.goto_next_start "@class.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]r", function()
  move.goto_next_start "@frame.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]t", function()
  move.goto_next_start "@attribute.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]e", function()
  move.goto_next_start "@scopename.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]]m", function()
  move.goto_next_start "@function.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]f", function()
  move.goto_next_start "@call.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]d", function()
  move.goto_next_start "@conditional.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]o", function()
  move.goto_next_start "@loop.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]a", function()
  move.goto_next_start "@parameter.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]b", function()
  move.goto_next_start "@block.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]l", function()
  move.goto_next_start "@class.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]r", function()
  move.goto_next_start "@frame.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]t", function()
  move.goto_next_start "@attribute.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]e", function()
  move.goto_next_start "@scopename.inner"
end)

vim.keymap.set({ "n", "x", "o" }, "]M", function()
  move.goto_next_end "@function.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]F", function()
  move.goto_next_end "@call.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]D", function()
  move.goto_next_end "@conditional.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]O", function()
  move.goto_next_end "@loop.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]S", function()
  move.goto_next_end "@statement.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]A", function()
  move.goto_next_end "@parameter.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]C", function()
  move.goto_next_end "@comment.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]B", function()
  move.goto_next_end "@block.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]L", function()
  move.goto_next_end "@class.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]R", function()
  move.goto_next_end "@frame.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]T", function()
  move.goto_next_end "@attribute.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]E", function()
  move.goto_next_end "@scopename.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "]]M", function()
  move.goto_next_end "@function.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]F", function()
  move.goto_next_end "@call.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]D", function()
  move.goto_next_end "@conditional.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]O", function()
  move.goto_next_end "@loop.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]A", function()
  move.goto_next_end "@parameter.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]B", function()
  move.goto_next_end "@block.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]L", function()
  move.goto_next_end "@class.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]R", function()
  move.goto_next_end "@frame.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]T", function()
  move.goto_next_end "@attribute.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "]]E", function()
  move.goto_next_end "@scopename.inner"
end)

vim.keymap.set({ "n", "x", "o" }, "[m", function()
  move.goto_previous_start "@function.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[f", function()
  move.goto_previous_start "@call.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[d", function()
  move.goto_previous_start "@conditional.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[o", function()
  move.goto_previous_start "@loop.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[s", function()
  move.goto_previous_start "@statement.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[a", function()
  move.goto_previous_start "@parameter.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[c", function()
  move.goto_previous_start "@comment.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[b", function()
  move.goto_previous_start "@block.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[l", function()
  move.goto_previous_start "@class.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[r", function()
  move.goto_previous_start "@frame.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[t", function()
  move.goto_previous_start "@attribute.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[e", function()
  move.goto_previous_start "@scopename.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[[m", function()
  move.goto_previous_start "@function.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[f", function()
  move.goto_previous_start "@call.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[d", function()
  move.goto_previous_start "@conditional.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[o", function()
  move.goto_previous_start "@loop.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[a", function()
  move.goto_previous_start "@parameter.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[b", function()
  move.goto_previous_start "@block.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[l", function()
  move.goto_previous_start "@class.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[r", function()
  move.goto_previous_start "@frame.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[t", function()
  move.goto_previous_start "@attribute.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[e", function()
  move.goto_previous_start "@scopename.inner"
end)

vim.keymap.set({ "n", "x", "o" }, "[M", function()
  move.goto_previous_end "@function.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[F", function()
  move.goto_previous_end "@call.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[D", function()
  move.goto_previous_end "@conditional.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[O", function()
  move.goto_previous_end "@loop.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[S", function()
  move.goto_previous_end "@statement.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[A", function()
  move.goto_previous_end "@parameter.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[C", function()
  move.goto_previous_end "@comment.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[B", function()
  move.goto_previous_end "@block.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[L", function()
  move.goto_previous_end "@class.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[R", function()
  move.goto_previous_end "@frame.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[T", function()
  move.goto_previous_end "@attribute.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[E", function()
  move.goto_previous_end "@scopename.outer"
end)
vim.keymap.set({ "n", "x", "o" }, "[[M", function()
  move.goto_previous_end "@function.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[F", function()
  move.goto_previous_end "@call.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[D", function()
  move.goto_previous_end "@conditional.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[O", function()
  move.goto_previous_end "@loop.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[A", function()
  move.goto_previous_end "@parameter.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[B", function()
  move.goto_previous_end "@block.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[L", function()
  move.goto_previous_end "@class.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[R", function()
  move.goto_previous_end "@frame.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[T", function()
  move.goto_previous_end "@attribute.inner"
end)
vim.keymap.set({ "n", "x", "o" }, "[[E", function()
  move.goto_previous_end "@scopename.inner"
end)

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

local repeat_move = require "nvim-treesitter-textobjects.repeatable_move"

-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true })
