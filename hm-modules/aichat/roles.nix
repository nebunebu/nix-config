{
  xdg.configFile = {
    "aichat/roles/conv-commit.md".text = # markdown
      ''
        ---
        model: gemini:gemini-1.5-flash-latest
        temperature: 0
        top_p: 0
        ---
        Generate three conventional commit messages based on __INPUT__. Each of the commit messages should be on its own line. Provide no additional line breaks. Provide no other output.
      '';
  };
}
