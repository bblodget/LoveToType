# Makefile for LoveToType
# Handles building the .love file and setting up the web distribution

# Config
LOVE_FILE = LoveToType.love
WEB_DIST_DIR = web-dist
SOURCES = *.lua images fonts sounds
NODE = node
ZIP = zip -9 -r
CP = cp
RM = rm -f

# Default target
all: $(LOVE_FILE) web

# Build the .love file
$(LOVE_FILE): $(SOURCES)
	@echo "Building $(LOVE_FILE)..."
	$(ZIP) $(LOVE_FILE) $(SOURCES)

# Alias for building the .love file
love: $(LOVE_FILE)

# Set up web distribution
web: $(LOVE_FILE)
	@echo "Setting up web distribution..."
	$(CP) $(LOVE_FILE) $(WEB_DIST_DIR)/
	@echo "Web distribution setup complete."

# Run the web server
run-web: web
	@echo "Starting web server at http://localhost:8000..."
	$(NODE) server.js

# Clean up build artifacts
clean:
	@echo "Cleaning up..."
	$(RM) $(LOVE_FILE)
	$(RM) $(WEB_DIST_DIR)/$(LOVE_FILE)

# Test desktop version
run-desktop: $(LOVE_FILE)
	@echo "Running desktop version..."
	love .

# Make sure these targets are run even if files with the same name exist
.PHONY: all web run-web clean run-desktop love

# Help target
help:
	@echo "LoveToType Makefile"
	@echo ""
	@echo "Targets:"
	@echo "  all         - Build .love file and set up web distribution (default)"
	@echo "  love        - Build just the .love file"
	@echo "  web         - Set up web distribution"
	@echo "  run-web     - Start web server at http://localhost:8000"
	@echo "  run-desktop - Run desktop version with LÖVE"
	@echo "  clean       - Remove build artifacts (.love files)"
	@echo "  help        - Show this help message" 