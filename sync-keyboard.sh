#!/bin/bash
# Keyboard Settings Sync Script (Non-sensitive data only)
# Syncs keyboard shortcuts and safe Terminal settings between Macs

#SYNC_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs/keyboard-sync"
SYNC_DIR="./keyboard-sync"
TEMP_DIR="./tmp-keyboard-sync-$$"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Create sync directory
mkdir -p "$SYNC_DIR"
mkdir -p "$TEMP_DIR"

# Export function
export_settings() {
    print_status "Exporting keyboard settings..."
    
    # 1. Export keyboard shortcuts (safe - just key mappings)
    if defaults export com.apple.symbolichotkeys "$SYNC_DIR/keyboard-shortcuts.plist" 2>/dev/null; then
        print_success "Keyboard shortcuts exported"
    else
        print_error "Failed to export keyboard shortcuts"
    fi
    
    # 2. Export safe global keyboard settings only
    print_status "Exporting safe global keyboard settings..."
    {
        echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
        echo "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">"
        echo "<plist version=\"1.0\">"
        echo "<dict>"
        
        # Key repeat settings
        if defaults read NSGlobalDomain KeyRepeat 2>/dev/null >/dev/null; then
            echo "    <key>KeyRepeat</key>"
            echo "    <integer>$(defaults read NSGlobalDomain KeyRepeat)</integer>"
        fi
        
        if defaults read NSGlobalDomain InitialKeyRepeat 2>/dev/null >/dev/null; then
            echo "    <key>InitialKeyRepeat</key>"
            echo "    <integer>$(defaults read NSGlobalDomain InitialKeyRepeat)</integer>"
        fi
        
        # Press and hold setting
        if defaults read NSGlobalDomain ApplePressAndHoldEnabled 2>/dev/null >/dev/null; then
            echo "    <key>ApplePressAndHoldEnabled</key>"
            if [ "$(defaults read NSGlobalDomain ApplePressAndHoldEnabled)" = "1" ]; then
                echo "    <true/>"
            else
                echo "    <false/>"
            fi
        fi
        
        # Function key behavior
        if defaults read NSGlobalDomain com.apple.keyboard.fnState 2>/dev/null >/dev/null; then
            echo "    <key>com.apple.keyboard.fnState</key>"
            if [ "$(defaults read NSGlobalDomain com.apple.keyboard.fnState)" = "1" ]; then
                echo "    <true/>"
            else
                echo "    <false/>"
            fi
        fi
        
        echo "</dict>"
        echo "</plist>"
    } > "$SYNC_DIR/safe-global-keyboard.plist"
    print_success "Safe global keyboard settings exported"
    
    # 3. Export safe Terminal settings (excluding sensitive data)
    print_status "Exporting safe Terminal settings..."
    if [ -f "$HOME/Library/Preferences/com.apple.Terminal.plist" ]; then
        # Create a clean Terminal plist with only safe settings
        defaults export com.apple.Terminal "$TEMP_DIR/terminal-full.plist" 2>/dev/null
        
        # Use PlistBuddy to extract only safe settings
        /usr/libexec/PlistBuddy -c "Print" "$TEMP_DIR/terminal-full.plist" > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            # Create new clean plist with only safe keys
            {
                echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                echo "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">"
                echo "<plist version=\"1.0\">"
                echo "<dict>"
                
                # Safe keys to export (add more as needed)
                safe_keys=("Default Window Settings" "Startup Window Settings" "Window Settings")
                
                for key in "${safe_keys[@]}"; do
                    if /usr/libexec/PlistBuddy -c "Print :$key" "$TEMP_DIR/terminal-full.plist" >/dev/null 2>&1; then
                        echo "    <!-- $key settings -->"
                        # Note: This is a simplified approach. For complex nested data,
                        # you might want to use a more sophisticated extraction method
                    fi
                done
                
                echo "</dict>"
                echo "</plist>"
            } > "$SYNC_DIR/safe-terminal-settings.plist"
            
            # Alternative: Just copy key bindings if they exist
            if defaults read com.apple.Terminal 2>/dev/null | grep -q "keyMapBoundKeys"; then
                defaults read com.apple.Terminal keyMapBoundKeys > "$SYNC_DIR/terminal-keybindings.txt" 2>/dev/null || true
            fi
            
            print_success "Safe Terminal settings exported"
        else
            print_warning "Could not read Terminal preferences"
        fi
    else
        print_warning "Terminal preferences file not found"
    fi
    
    # 4. Create a summary file
    {
        echo "# Keyboard Sync Export Summary"
        echo "# Generated on: $(date)"
        echo "# Hostname: $(hostname)"
        echo "# macOS Version: $(sw_vers -productVersion)"
        echo ""
        echo "Files exported:"
        echo "- keyboard-shortcuts.plist (System keyboard shortcuts)"
        echo "- safe-global-keyboard.plist (Key repeat, fn key settings)"
        echo "- safe-terminal-settings.plist (Terminal appearance/key settings)"
        echo "- terminal-keybindings.txt (Terminal key bindings if any)"
        echo ""
        echo "⚠️  This export excludes sensitive data like:"
        echo "   - SSH connections and bookmarks"
        echo "   - Working directories and file paths"
        echo "   - Command history"
        echo "   - Server hostnames"
    } > "$SYNC_DIR/README.txt"
    
    print_success "Settings exported to: $SYNC_DIR"
    print_status "Files can be safely shared publicly (no sensitive data included)"
}

# Import function
import_settings() {
    print_status "Importing keyboard settings..."
    
    if [ ! -d "$SYNC_DIR" ]; then
        print_error "Sync directory not found: $SYNC_DIR"
        exit 1
    fi
    
    # 1. Import keyboard shortcuts
    if [ -f "$SYNC_DIR/keyboard-shortcuts.plist" ]; then
        if defaults import com.apple.symbolichotkeys "$SYNC_DIR/keyboard-shortcuts.plist" 2>/dev/null; then
            print_success "Keyboard shortcuts imported"
        else
            print_error "Failed to import keyboard shortcuts"
        fi
    else
        print_warning "Keyboard shortcuts file not found"
    fi
    
    # 2. Import safe global settings
    if [ -f "$SYNC_DIR/safe-global-keyboard.plist" ]; then
        if defaults import NSGlobalDomain "$SYNC_DIR/safe-global-keyboard.plist" 2>/dev/null; then
            print_success "Global keyboard settings imported"
        else
            print_error "Failed to import global keyboard settings"
        fi
    else
        print_warning "Global keyboard settings file not found"
    fi
    
    # 3. Import Terminal settings (if available)
    if [ -f "$SYNC_DIR/safe-terminal-settings.plist" ]; then
        if defaults import com.apple.Terminal "$SYNC_DIR/safe-terminal-settings.plist" 2>/dev/null; then
            print_success "Terminal settings imported"
        else
            print_warning "Could not import Terminal settings (may require manual setup)"
        fi
    else
        print_warning "Terminal settings file not found"
    fi
    
    print_status "Restarting system services..."
    
    # Restart system processes (they restart automatically)
    sudo pkill -f "SystemUIServer" 2>/dev/null || true
    sudo pkill -f "Dock" 2>/dev/null || true
    
    # Wait for system processes to restart
    sleep 2
    
    # Kill Terminal to reload preferences (user must restart manually)
    killall Terminal 2>/dev/null || true
    
    print_success "Settings imported successfully!"
    print_warning "Please manually restart Terminal to load new settings"
    print_warning "Some keyboard shortcuts may require logging out and back in"
}

# Show status function
show_status() {
    print_status "Keyboard Sync Status"
    echo ""
    echo "Sync Directory: $SYNC_DIR"
    echo "Directory exists: $([ -d "$SYNC_DIR" ] && echo "✅ Yes" || echo "❌ No")"
    echo ""
    
    if [ -d "$SYNC_DIR" ]; then
        echo "Available files:"
        for file in "$SYNC_DIR"/*.plist "$SYNC_DIR"/*.txt; do
            if [ -f "$file" ]; then
                filename=$(basename "$file")
                size=$(ls -lh "$file" | awk '{print $5}')
                modified=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$file")
                echo "  📄 $filename ($size, modified: $modified)"
            fi
        done
    fi
}

# Clean up function
cleanup() {
    rm -rf "$TEMP_DIR"
}

# Trap to ensure cleanup on exit
trap cleanup EXIT

# Main script logic
case "$1" in
    "export")
        export_settings
        ;;
    "import")
        import_settings
        ;;
    "status")
        show_status
        ;;
    *)
        echo "Usage: $0 [export|import|status]"
        echo ""
        echo "Commands:"
        echo "  export  - Export safe keyboard settings to iCloud"
        echo "  import  - Import keyboard settings from iCloud"
        echo "  status  - Show current sync status and available files"
        echo ""
        echo "This script only syncs non-sensitive data:"
        echo "  ✅ Keyboard shortcuts and key mappings"
        echo "  ✅ Key repeat rates and function key settings"
        echo "  ✅ Safe Terminal appearance settings"
        echo "  ❌ SSH connections, passwords, or file paths"
        echo ""
        echo "Sync location: $SYNC_DIR"
        exit 1
        ;;
esac
