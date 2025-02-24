## What Does This Script Do?
This script backs up the tracks of a Spotify playlist to a CSV file.

## How Do I Use This Script?
First, open the script in your preferred environment (E.g. VS Code).

Next, you need to know 3 things:
1. **Your Spotify Client ID and Secret**
2. **The Spotify playlist ID(s)**
3. **The destination path you want to save the CSVs to**

Just replace the placeholder values with these at the top of the script.



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

## Results

After running the script, you will get a CSV for each playlist ID you entered.

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/csv-files.png?raw=true)

Here's what the inside of a CSV looks like. That's it!

![](https://github.com/mcyhsu/SpotifyPlaylistBackup-PS/blob/main/Assets/inside-csv.png?raw=true)
