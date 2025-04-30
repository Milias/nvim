local gemini_prompt = [[
You are the backend of an AI-powered code completion engine. Your task is to
provide code suggestions based on the user's input. The user's code will be
enclosed in markers:

- `<contextAfterCursor>`: Code context after the cursor
- `<cursorPosition>`: Current cursor location
- `<contextBeforeCursor>`: Code context before the cursor
]]

local gemini_few_shots = {}

gemini_few_shots[1] = {
  role = "user",
  content = [[
# language: python
<contextBeforeCursor>
def fibonacci(n):
    <cursorPosition>
<contextAfterCursor>

fib(5)]],
}

local gemini_chat_input_template =
  "{{{language}}}\n{{{tab}}}\n<contextBeforeCursor>\n{{{context_before_cursor}}}<cursorPosition>\n<contextAfterCursor>\n{{{context_after_cursor}}}"

gemini_few_shots[2] = require("minuet.config").default_few_shots[2]

require("minuet").setup {
  cmp = {
    enable_auto_complete = true,
  },
  virtualtext = {
    auto_trigger_ft = {},
    keymap = {
      -- accept whole completion
      accept = "<S-Enter>",
      -- accept one line
      accept_line = "<C-S-Enter>",
      -- accept n lines (prompts for number)
      -- e.g. "A-z 2 CR" will accept 2 lines
      accept_n_lines = "<C-S-A>",
      -- Cycle to prev completion item, or manually invoke completion
      prev = "<S-Tab>",
      -- Cycle to next completion item, or manually invoke completion
      next = "<Tab>",
      dismiss = "<A-e>",
    },
  },
  provider = "openai_compatible",
  request_timeout = 2.5,
  throttle = 1500, -- Increase to reduce costs and avoid rate limits
  debounce = 600, -- Increase to reduce costs and avoid rate limits
  provider_options = {
    openai_compatible = {
      api_key = function()
        return io.open("/home/francisco/.config/nvim/.env", "rb"):read "*a"
      end,
      system = {
        prompt = gemini_prompt,
      },
      few_shots = gemini_few_shots,
      chat_input = {
        template = gemini_chat_input_template,
      },
      end_point = "https://openrouter.ai/api/v1/chat/completions",
      model = "google/gemini-2.5-flash-preview",
      name = "Openrouter",
      stream = false,
      optional = {
        max_tokens = 512,
        top_p = 0.9,
        provider = {
          -- Prioritize throughput for faster completion
          sort = "throughput",
        },
      },
    },
  },
}
