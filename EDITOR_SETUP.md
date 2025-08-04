# Editor Setup for Auto-Linting

This project is configured to automatically fix RuboCop linting issues on save.

## VS Code Setup (Recommended)

### 1. Install Required Extensions

The project includes `.vscode/extensions.json` with recommended extensions. VS Code will automatically suggest installing them.

**Key Extensions:**
- `rebornix.ruby` - Ruby language support
- `misogi.ruby-rubocop` - RuboCop integration
- `castwide.solargraph` - Ruby IntelliSense

### 2. Settings Applied

The `.vscode/settings.json` file configures:
- **Auto-fix on save** for Ruby files using RuboCop
- **Format on save** enabled
- **Trim trailing whitespace** automatically
- **Insert final newline** automatically
- **Auto-save** on focus change

### 3. Manual Commands

If you need to run RuboCop manually:

```bash
# Check all files
bin/rubocop

# Auto-fix issues
bin/rubocop -A

# Check specific file
bin/rubocop app/models/user.rb
```

## Other Editors

### RubyMine/IntelliJ
1. Go to `Preferences > Tools > External Tools`
2. Add RuboCop with command: `bin/rubocop -A`
3. Set up as "Save Action" in `Preferences > Tools > Actions on Save`

### Vim/Neovim
Install ALE plugin with RuboCop integration:
```vim
Plug 'dense-analysis/ale'
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ale_fix_on_save = 1
```

### Sublime Text
Install `SublimeLinter-rubocop` package and enable fix on save.

## EditorConfig

The `.editorconfig` file ensures consistent formatting across all editors:
- 2-space indentation
- LF line endings
- UTF-8 encoding
- Trim trailing whitespace
- Insert final newline

## Troubleshooting

### RuboCop not running on save?
1. Ensure the Ruby extension is installed and active
2. Check that `bin/rubocop` exists and is executable
3. Restart VS Code after installing extensions
4. Check VS Code's Output panel for Ruby extension logs

### Different formatting between editor and CI?
1. Ensure you're using `bin/rubocop` (project's Bundler version)
2. Check that `.rubocop.yml` configuration is being respected
3. Run `bundle exec rubocop --version` to verify version consistency

## CI Integration

The project uses ReviewDog in GitHub Actions to provide inline PR comments for any remaining linting issues, ensuring high code quality while providing excellent developer experience.
