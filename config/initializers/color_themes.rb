require 'pathname'

# Generate the path to the .yml file with the available color themes.
color_themes_file = Pathname.new(__FILE__).dirname.join('..').expand_path.join("color_themes.yml")
# Check in case config/color_themes.yml does not exist.
if color_themes_file.exist?
  # Load the file specified by the generated path.
  color_themes = YAML.load_file(color_themes_file)
  # If the file contains one or more color themes, include them in AVAILABLE_COLOR_THEMES, else include the original theme.
  AVAILABLE_COLOR_THEMES = (color_themes["available"].length > 0) ? color_themes["available"] : { "original" => "original.scss" }
else
  AVAILABLE_COLOR_THEMES = { "original" => "original.scss" }
end
# Get all codes from available themes into a separate variable, so that they can be called easier.
AVAILABLE_COLOR_THEME_CODES = AVAILABLE_COLOR_THEMES.keys

# The default color theme, that will be called when no color theme is specified.
DEFAULT_COLOR_THEME = "original"
