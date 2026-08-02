vim.pack.add({
  -- { src = "wsdjeg/job.nvim" },
  -- { src = "wsdjeg/notify.nvim" },
  { src = "https://github.com/wsdjeg/toml.nvim" },
  { src = "https://github.com/wsdjeg/code-runner.nvim" },
  { src = "https://github.com/wsdjeg/tasks.nvim" },
})

require("tasks").setup({
  global_tasks = "~/tasks/tasks.toml",
  local_tasks = ".tasks.toml",
})
