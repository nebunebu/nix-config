{ pkgs, ... }:
{
  # TODO:
  # add more roles
  # add macros
  xdg.configFile."aichat/config.yaml".source = pkgs.writers.writeYAML "aichat-config.yaml" {
    # --- Default Model ---
    model = "gemini";
    clients = [
      {
        type = "claude";
        # temperature = 0.7; # Added specific temperature for better control
        # top_p = 0.9; # Added specific top_p for better control
      }
      {
        type = "gemini";
        patch = {
          chat_completions = {
            ".*" = {
              body = {
                safetySettings = [
                  {
                    category = "HARM_CATEGORY_HARASSMENT";
                    threshold = "BLOCK_NONE";
                  }
                  {
                    category = "HARM_CATEGORY_HATE_SPEECH";
                    threshold = "BLOCK_NONE";
                  }
                  {
                    category = "HARM_CATEGORY_SEXUALLY_EXPLICIT";
                    threshold = "BLOCK_NONE";
                  }
                  {
                    category = "HARM_CATEGORY_DANGEROUS_CONTENT";
                    threshold = "BLOCK_NONE";
                  }
                ];
              };
            };
          };
        };
      }
      {
        type = "openai-compatible";
        name = "local";
        api_base = "http://192.168.1.177:11434/v1";
        models = [
          {
            name = "mistral-small:latest";
            max_input_tokens = 8192; # Added token limit
          }
          {
            name = "dolphin-mixtral:8x7b";
            max_input_tokens = 32768; # Added token limit
          }
          {
            name = "qwen2.5:7b";
            max_input_tokens = 8192; # Added token limit
          }
          {
            name = "deepseek-r1:8b";
            max_input_tokens = 8192; # Added token limit
          }
          {
            name = "deepseek-r1:32b";
            max_input_tokens = 32768; # Added token limit
          }
          {
            name = "nomic-embed-text";
            type = "embedding";
            max_tokens_per_chunk = 8192;
            default_chunk_size = 1000;
            max_batch_size = 50;
          }
        ];
      }
    ];

    # --- Behavior ---
    stream = true;
    save = true;
    keybindings = "vi";
    editor = "nvim";
    wrap = 59; # Increased for better readability
    wrap_code = false; # Enable code wrapping for better display

    # --- Function Calling ---
    function_calling = true;
    use_tools = "fs"; # Enabled file system tools

    # --- Session ---
    save_session = true;
    compress_threshold = 4000;
    summarize_prompt = "Summarize the discussion briefly in 200 words or less to use as a prompt for future context.";
    summary_prompt = "This is a summary of the chat history as a recap: ";

    # --- RAG ---
    rag_embedding_model = "local:nomic-embed-text";
    rag_reranker_model = null;
    # rag_top_k = 4;
    rag_chunk_size = 1000; # Added specific chunk size
    rag_chunk_overlap = 200; # Added overlap for better context

    # --- Appearance ---
    highlight = true;
    light_theme = false;
    left_prompt = "{color.green}{?session {?agent {agent}>}{session}{?role /}}{!session {?agent {agent}>}}{role}{?rag @{rag}}{color.cyan}{?session )}{!session >}{color.reset} ";
    right_prompt = "{color.yellow}{model_name} {color.light_blue}[{?consume_tokens {consume_tokens}{color.magenta}({consume_percent:.2f}%){color.light_blue}}{!consume_tokens -}]{color.reset}";

    # --- Misc ---
    server_addr = "127.0.0.1:8000";
    user_agent = "auto"; # Set to auto for version tracking
    save_shell_history = true;
  };
}
