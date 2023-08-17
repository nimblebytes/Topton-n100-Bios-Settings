#!/bin/sh

PASSMARK_URL="https://www.passmark.com/downloads/pt_linux_x64.zip"
INSTALL_DIR="/opt/passmark"
PASSMARK_EXECUTABLE="$INSTALL_DIR/passmark"

# Check if sudo is required
if [ "$(id -u)" -ne 0 ]; then
    SUDO_REQUIRED="true"
fi

# Check if PassMark executable is already available locally
if [ -f "$PASSMARK_EXECUTABLE" ]; then
    echo "PassMark software is already installed locally."
else
    # Download PassMark software
    echo "Downloading PassMark software..."
    if [ "$SUDO_REQUIRED" ]; then
        sudo curl -o passmark.zip "$PASSMARK_URL"
    else
        curl -o passmark.zip "$PASSMARK_URL"
    fi

    # Extract and install
    echo "Installing PassMark software..."
    if [ "$SUDO_REQUIRED" ]; then
        sudo mkdir -p "$INSTALL_DIR"
        sudo unzip -o passmark.zip -d "$INSTALL_DIR"
    else
        mkdir -p "$INSTALL_DIR"
        unzip -o passmark.zip -d "$INSTALL_DIR"
    fi

    # Clean up
    rm passmark.zip

    echo "PassMark software installed successfully."
fi

# Run PassMark test
echo "Running PassMark test..."
if [ "$SUDO_REQUIRED" ]; then
    sudo "$PASSMARK_EXECUTABLE" --run-test
else
    "$PASSMARK_EXECUTABLE" --run-test
fi

echo "PassMark test completed."
