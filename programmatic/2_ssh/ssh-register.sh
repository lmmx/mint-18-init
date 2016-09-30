# Check it's set up already to be able to register with the website
echo "Hit enter/any key to confirm that you've created the RSA key (or 'q' to quit)" >&2
read CONFIRM_KEY
if [[ "$CONFIRM_KEY" == "q" ]]; then echo "Cancelling..." >&2; exit 1; fi

# Install xclip
echo "Installing xclip (just do it anyway if you're already up to date" >&2
sudo apt-get install xclip

echo "Copying your id_rsa.pub file to the clipboard (in ~/.ssh by default)"
xclip -sel clip < ~/.ssh/id_rsa.pub

echo "Hit any key to add the key now on your clipboard to GitHub:" >&2
read dummyvar
google-chrome https://github.com/settings/keys

echo "After that, all should be good to go :-)" >&2
