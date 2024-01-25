printf "hi, this bash script installs some pip packages, and is located at:\n$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )\nplease edit this to your preferences.\n"
read -p "if you have already carefully edited this bash script, and make sure you have python3 and pip3 installed. input y to run. " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# youtube downloader
pip3 install yt-dlp

# spotify downloader
pip3 install spotify_dl
