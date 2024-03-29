return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      -- neotest-plenary
      table.insert(opts.adapters, "neotest-plenary")

      -- neotest-jest
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )

      -- neotest-vitest
      table.insert(opts.adapters, require("neotest-vitest"))
    end,
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
    },
  },
}
