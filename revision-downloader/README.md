### Revision downloader

Revision downloader is an AppleScript which allows you to download the source code of all
revisions of a list of posts. It even downloads **deleted** posts (if you have the
privilege to see them – this requires 10k reputation on normal sites and 4k on beta
sites). This is what makes this script really useful; otherwise, you could just use the
Stack Exchange API.

Created by Glorfindel

For results (downloaded posts), see [here](./results/README.md).

## Instructions / prerequisites

- You'll need a MacBook, Mac Mini or something else which runs macOS. Yes, they're not
cheap, but they retain their value.
- For using regexes in AppleScript, you'll need to install the [Satimage component][1].
- You need to be logged in on the Stack Exchange site you're going to crawl, and Safari
needs to be launched.
- Go to the [SEDE query][2] and be sure to execute it on the right database/site.
- Export the SEDE results as a .CSV file.
- (Optional) Filter on spam or offensive posts only.
- Export the values in the `Post ID` column to a new file `input.txt` in the folder you
want to use for downloading. There are some sample files in the GitHub repository, but be
sure to rename them (the script is looking for a file named `input.txt`).
- Open the `Revision downloader.scpt` file in the Script Editor.
- In the first lines, define the `base_url` of the Stack Exchange site and the `folder`
you want to use for downloading.
- Run the script.
- Grab some beers and wait a couple of hours - the script downloads ±900 posts per hour.
- Profit!
- The script might fail under certain circumstances (e.g. a hickup in the Internet
connection), or it might produce a handful of empty files. In those cases, it is best just
to delete the already downloaded posts from `input.txt` and start the script again. I\
haven't seen any rate limiting by Stack Exchange yet.

 [1]: http://www.satimage.fr/software/downloads/Satimage411.pkg
 [2]: http://data.stackexchange.com/stackoverflow/query/646101/