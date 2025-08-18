# 🎶 music-cli

A simple **command-line music player & downloader** inspired by [ani-cli](https://github.com/pystardust/ani-cli).
Search, stream, and download songs from **JioSaavn** and **YouTube** — right from your terminal.

## ✨ Features

* ✨ High quality 320kbps audio streaming and downloading without logging in.
* 🔎 Search and play songs from **JioSaavn** or **YouTube**
* 🎧 Stream directly with **mpv**, **flatpak mpv**
* ⬇️ Download songs in **MP3/MP4** (YouTube via `yt-dlp`, JioSaavn via `aria2c`)
* 📜 Keeps **play history** for easy resume
* 📺 Play **YouTube playlists** directly
* 🔄 Loop songs, background playback, and fallback between JioSaavn ↔ YouTube
* 🖥️ Choose between **fzf** or **rofi** as menu UI

## 📦 Dependencies

Make sure the following are installed:

* [`curl`](https://curl.se/)
* [`jq`](https://stedolan.github.io/jq/)
* [`fzf`](https://github.com/junegunn/fzf) **or** [`rofi`](https://github.com/davatorium/rofi)
* [`yt-dlp`](https://github.com/yt-dlp/yt-dlp)
* [`aria2c`](https://aria2.github.io/)
* [`mpv`](https://mpv.io/)

## 🚀 Installation

Clone the repo and make the script executable:

```bash
git clone https://github.com/yourusername/music-cli
cd music-cli
chmod +x music-cli.sh
```

Optionally add it to your `$PATH`:

```bash
sudo ln -s $(pwd)/music-cli.sh /usr/local/bin/music-cli
```

Now run with:

```bash
music-cli believer
```

## 🎮 Usage

```
Usage:
music-cli [options] [query]

Options:
  -c, --continue        Continue playing from history
  -d, --download        Download the song instead of playing it
  -D, --delete          Delete history
  -q, --quality         Specify audio quality (128/320, default: 320)
  -b, --background      Play in background
  -l, --loop            Loop current track
  -y, --youtube         Force YouTube search
  -f, --fallback        Enable YouTube fallback (default)
  --no-fallback         Disable YouTube fallback
  --rofi                Use rofi instead of fzf
  -P, --yt-playlist URL Play YouTube playlist
  -h, --help            Show help
  -v, --version         Show version
```

## 📝 Examples

```bash
# Play a song from JioSaavn
music-cli believer

# Play in highest quality (320 kbps)
music-cli -q 320 houdini

# Background play & loop
music-cli -b -l sugar crash

# Download a song
music-cli -d imagine dragons

# Force YouTube search
music-cli -y never gonna give you up

# Play a YouTube playlist
music-cli -P "https://youtube.com/playlist?list=..."
```

## 📂 History

* Saved in: `~/.local/state/music-cli/music-history`
* Automatically updated after each play
* Supports `--continue` to resume last played track

## 🙌 Credits

* Inspired by [ani-cli](https://github.com/pystardust/ani-cli)
* YouTube via `yt-dlp`
* Built with ❤️ for the terminal

---


I am by no means affiliated or related with YouTube or Reliance JIO/ JioSaavn.
