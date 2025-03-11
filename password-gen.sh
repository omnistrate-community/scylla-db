# Check if password is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <password>"
    exit 1
fi

password="$1"
salt=$(openssl rand -base64 12 | tr -d '=' | tr '+/' '._')

# Generate SHA-512 hash with salt
hashed=$(echo "$password" | openssl passwd -6 -salt "$salt" -stdin)

echo "$hashed"