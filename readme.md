## What Does This Script Do?
This script backs up the tracks of a Spotify playlist to a CSV file.

## What Problem Does This Script Solve?

Are you afraid of losing access to your Spotify playlists, or having some songs removed with no way of knowing which ones? ([Picture source](https://community.spotify.com/t5/Other-Podcasts-Partners-etc/Songs-disappear-and-are-impossible-to-play/td-p/5162188))

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/missing-songs.PNG?raw=true)

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/missing-songs2.PNG?raw=true)


This script won't prevent your songs from getting deleted, but at least it can save your playlist information so that you can rebuild your playlist from scratch if you need to.

## How Do I Use This Script?
Download and open a copy of this script in your preferred environment (E.g. VS Code).

Next, you need to know 3 things:
1. **Your Spotify Client ID and Secret**
2. **The Spotify playlist ID(s)**
3. **The destination path you want to save the CSVs to**

Just replace the placeholder values with these at the top of the script.

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/fill-in-information.png?raw=true)

Then, when you run the script, it will save the information for all tracks in the playlist to a CSV file, one CSV for each playlist ID entered.

## Where Can I Find My Spotify Client ID and Secret?

First head to the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard).

Make an account if you haven't already, and then click on **Create app**

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/create-app.png?raw=true)

You need to fill in the app details. If you don't actually plan on making an app, it doesn't really matter what you fill in.

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/enter-app-details.png?raw=true)

Once you're in the App Dashboard, click on **Settings**

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/go-to-settings.png?raw=true)

Finally, click on **View client secret** to show your Client ID and Secret.

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/client-id-and-secret.png?raw=true)

## Where Can I Find the Spotify Playlist ID?

The playlist ID is included in the URL. We only want the **playlist ID**, NOT the full URL!

This is the full URL (Incorrect):
```
https://open.spotify.com/playlist/3BwgXaIGhTd7EfZB4Ju0Vp
```
We want the string of characters after "https://open.spotify.com/playlist/". 

This is the actual playlist ID (Correct):
```
3BwgXaIGhTd7EfZB4Ju0Vp
```

## Results

After running the script, you will get a CSV for each playlist ID you entered.

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/csv-files.png?raw=true)

Here's what the inside of a CSV looks like. That's it!

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/inside-csv.png?raw=true)
