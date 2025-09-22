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
* 🖥️ Choose between **fzf** or **rofi** as menu UI with custom rofi styling

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
git clone https://github.com/exilonium/music-cli
cd music-cli
chmod +x music-cli
```

Run it with

```bash
./music-cli

```

Optionally add it to your `$PATH`:

```bash
cp $(pwd)/music-cli ~/.local/bin/music-cli
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
  -df, --download-force Force download a song (if it already exists)
  -D, --delete          Delete history
  -q, --quality         Specify audio quality (128/320, default: 320)
  -b, --background      Play in background (default is foreground)
  -l, --loop            Loop current track
  -y, --youtube         Force YouTube search instead of JioSaavn
  -f, --fallback        Enable YouTube fallback (default: enabled)
  --no-fallback         Disable YouTube fallback
  -r, --radio [station] Play radio station continuously (Pop, Jazz, Rock, Romance, etc.)
  -R, --record          Record while playing (saves stream to file using mpv cache)
  --rofi                Use rofi instead of fzf
  --rofi-args "args"    Use rofi with custom arguments (automatically enables --rofi)
  -h, --help            Show this help
  -v, --version         Show version
  -P, --yt-playlist URL plays a playlist from yt
  -U, --update          Update this script

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

# Use rofi with custom styling
music-cli --rofi-args "-theme gruvbox-dark -font 'JetBrains Mono 12'" believer

# Use rofi with custom width and colors
music-cli --rofi-args "-width 50 -theme-str 'window {background-color: #282828;}'" imagine dragons
```

## 🎨 Rofi Customization

The `--rofi-args` option allows you to customize rofi's appearance and behavior:

```bash
# Custom theme
music-cli --rofi-args "-theme ~/.config/rofi/music.rasi" song_name

# Custom font and colors
music-cli --rofi-args "-font 'Fira Code 14' -theme-str 'window {background-color: #1e1e2e;}'" song_name

# Custom width and position
music-cli --rofi-args "-width 60 -location 2" song_name
```

Any valid rofi arguments can be passed through `--rofi-args`. This automatically enables rofi mode, so you don't need to specify `--rofi` separately.

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
