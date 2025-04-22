#!/bin/bash

# Exit on error
set -e

# Check that folder name was provided.
if test -z "$1"; then
    echo "Please provide a project name."
    exit 1
fi

PROJECT_NAME=$1

# Create project folder + cd
mkdir -p "$PROJECT_NAME" && cd "$PROJECT_NAME"

# Install + init dependencies
npm init -y
npm install vite tailwindcss @tailwindcss/vite

# Create Vite configuration file
cat <<EOF > vite.config.mjs
import { defineConfig } from 'vite';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  plugins: [
    tailwindcss(),
  ],
});
EOF

# Create images folder.
mkdir -p public/images src

# Create index.html
# Preload style.css so screen won't flash on style save.
cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tailwind + Vite</title>
    <link rel="stylesheet" href="/src/style.css">
    <script type="module" src="/src/main.js" defer></script>
</head>
<body class="flex justify-center items-center h-screen bg-gray-700">
    <h1 class="text-3xl font-bold text-blue-600">Are the styles working? :S</h1>
</body>
</html>
EOF

# Create src/style.css
cat <<EOF > src/style.css
@import "tailwindcss";
EOF

# Create src/main.js
echo 'import "./style.css"' > src/main.js

# Add "npm run dev" command.
npm pkg set scripts.dev="vite"

# Print success message
echo "Project '$PROJECT_NAME' created successfully!"