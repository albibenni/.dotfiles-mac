# Function to update all global languages managed by mise
update_mise_langs() {
    echo "🔄 Updating mise itself and its plugins..."
    mise self-update -y || echo "mise is already up to date or installed via brew."
    mise plugin update

    echo "🚀 Installing and setting the latest versions globally..."
    mise use -g node@latest
    mise use -g python@latest
    mise use -g go@latest
    mise use -g java@latest

    echo "🧹 Pruning old and unused versions to free up space..."
    mise prune -y

    echo "✅ All global languages have been updated to the latest versions!"
    mise ls -g
}
