# Ensure base16-builder is installed
if ! command -v base16-builder 2>/dev/null; then
  echo "Installing Base16 Builder"
  yarn global add base16-builder
fi

# BUG FIX: The base16-builder is currently not bundled with the nvim theme. Until that's fixed, I'll
# manually download the theme file. https://github.com/base16-builder/base16-builder/issues/167
curl \
  -L \
  -o /tmp/nvim.ejs \
  https://github.com/base16-builder/base16-builder/raw/master/db/templates/nvim/both.ejs \

# Generate the themes folder
mkdir -p $HOME/.config/nvim/themes

# Build the theme
base16-builder \
  -t /tmp/nvim.ejs \
  -s $HOME/.dotfiles/themes/landon.yml \
  -b light \
  > $HOME/.config/nvim/themes/landon.vim