# Description: This script backs up the tracks of a Spotify playlist to a CSV file.

###############################  ENTER YOUR DETAILS HERE  ###############################

# Get the client ID and secret from the Spotify Developer Dashboard: https://developer.spotify.com/dashboard
$clientId = "clientID-here"
$clientSecret = "clientSecret-here"

# Enter one or more playlist IDs here, separated by commas, but don't leave a trailing comma for the last one
# MAKE SURE THE PLAYLIST IS PUBLIC or the API won't be able to access it
$playlistId = @("playlistID-1","playlistID-2","playlistID-3")

# Enter the destination folder where the CSV files will be saved and do not include a filename
$destination = "C:/path/to/destination/"

###############################  ENTER YOUR DETAILS HERE  ###############################

# Encode the client ID and secret
$authHeader = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$clientId`:$clientSecret"))

# Define the token URL, headers, and body
$tokenUrl = "https://accounts.spotify.com/api/token"
$headers = @{
    "Authorization" = "Basic $authHeader"
    "Content-Type"  = "application/x-www-form-urlencoded"
}
$body = "grant_type=client_credentials"

# Make the request
try {
    $response = Invoke-RestMethod -Uri $tokenUrl -Method Post -Headers $headers -Body $body
} catch {
    Write-Host "Error getting access token: $_" -ForegroundColor Red
    Exit
}

# Extract the access token
$accessToken = $response.access_token

# Initialize a counter for generic names
$genericCounter = 1

# For each playlist ID provided, get the track info and save them to a CSV file
foreach($playlist in $playlistId) {
    $apiUrl = "https://api.spotify.com/v1/playlists/$playlist/tracks"

    # Define headers with the access token
    $headers = @{
        "Authorization" = "Bearer $accessToken"
    }

    # Make the API request
    try {
        $playlistData = Invoke-RestMethod -Uri $apiUrl -Method Get -Headers $headers
    } catch {
        Write-Host "Error accessing playlist ${$playlist}: $_" -ForegroundColor Red
        continue
    }
    # Check if there are more pages
    $nextPage = $playlistData.next

    # If there are, keep making requests until there are no more pages
    while ($nextPage) {
        $nextPageData = Invoke-RestMethod -Uri $nextPage -Method Get -Headers $headers
        $playlistData.items += $nextPageData.items
        $nextPage = $nextPageData.next
    }

    # Extract the relevant data from the playlist
    $playlistTrackData = $playlistData.items | ForEach-Object {

        # Convert the track duration from milliseconds to minutes and seconds
        $durationMs = $_.track.duration_ms
        $minutes = [int][math]::Floor($durationMs / 60000)
        $seconds = [int][math]::Floor(($durationMs % 60000) / 1000)
        $formattedDuration = "{0}:{1:D2}" -f $minutes, $seconds

        # Create a custom object with the relevant data
        [PSCustomObject]@{
            TrackName = $_.track.name
            Artist = $_.track.artists.name
            Album = $_.track.album.name
            TrackLength = $formattedDuration # throws an error
        }
    }

    # Get the playlist title
    try {
        $playlistTitle = (Invoke-RestMethod -Uri "https://api.spotify.com/v1/playlists/$playlist" -Method Get -Headers $headers).name
    } catch {
        Write-Host "Error getting playlist title: $_" -ForegroundColor Red
    }

    # Sanitize the playlist title by removing invalid characters
    $sanitizedTitle = $playlistTitle -replace '[<>:"/\\|?*\[\]]', ''

    # If the sanitized title is empty or invalid, use a generic name
    if ([string]::IsNullOrWhiteSpace($sanitizedTitle)) {
        $sanitizedTitle = "playlist$genericCounter"
        $genericCounter++
    }
    
    # Get the current date and time
    $currentTime = Get-Date -Format "yyyy-MM-dd-HH-mm"

    # Combine playlist title and current time to form the file name
    $fileName = "$sanitizedTitle-$currentTime"
    
    # Combine the destination path and file name to get the complete path
    $completePath = $destination + $fileName + ".csv"

    # Export the playlist data to a CSV file
    try {
        $playlistTrackData | Export-Csv -Path $completePath -NoTypeInformation -Encoding utf8BOM
        Write-Host "$sanitizedTitle playlist data saved to: $completePath" -ForegroundColor Green
    } catch {
        Write-Host "Error exporting playlist data to CSV file: $_" -ForegroundColor Red
    }

}