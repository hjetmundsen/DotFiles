return {
  "stevearc/conform.nvim",
  lazy = false,
  opts = {
    formatters_by_ft = {
      java = { "google-java-format" },
      kotlin = { "ktlint" },
      python = { "ruff" },
      javascript = { "prettier" },
      typescript = { "prettier" },
    }
  }
}
