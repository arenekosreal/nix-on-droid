{
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "github_dark_dimmed";
      editor = {
        auto-save = true;
        color-modes = true;
        cursorline = true;
        indent-guides = {
          render = true;
        };
      };
    };
    languages = {
      language = [
        {
          name = "python";
          language-servers = [
            "basedpyright"
            "pyright"
          ];
          debugger = {
            name = "debugpy";
            transport = "stdio";
            command = "python";
            args = ["-m" "debugpy.adapter"];
            templates = [
              {
                name = "source";
                request = "launch";
                args = {
                  mode = "debug";
                  program = "{0}";
                };
                completion = [
                  {
                    name = "entrypoint";
                    completion = "filename";
                    default = ".";
                  }
                ];
              }
            ];
          };
          formatter = {
            command = "ruff";
            args = ["format" "-"];
          };
        }
      ];
      language-server = {
        basedpyright = {
          command = "basedpyright-langserver";
          args = ["--stdio"];
          config = {
            basedpyright.analysis = {
              autoImportCompletions = true;
              autoSearchPaths = true;
              diagnosticMode = "workspace";
              diagnosticSeverityOverrides = {
                reportMissingTypeStubs = "warning";
              };
              typeCheckingMode = "strict";
              useLibraryCodeForTypes = true;
            };
          };
        };
        pyright = {
          config = {
            python.analysis = {
              autoImportCompletions = true;
              autoSearchPaths = true;
              diagnosticMode = "workspace";
              diagnosticSeverityOverrides = {
                reportMissingTypeStubs = "warning";
              };
              typeCheckingMode = "strict";
              useLibraryCodeForTypes = true;
            };
          };
        };
      };
    };
}
