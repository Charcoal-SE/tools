-- Constants
set base_url to "http://meta.stackexchange.com"
set theFolder to "/Users/gerwin/Desktop/SE/"
set beginOfCode to "<pre style=\"width:650px; white-space:pre-wrap\">"
set endOfCode to "</pre>"

-- Read file
set inputFilename to theFolder & "input.txt"
set inputFile to (open for access (POSIX file inputFilename))
set post_ids to paragraphs of (read inputFile for (get eof inputFile))
close access inputFile

repeat with post_id in post_ids
	if length of post_id > 0 then
		tell application "Safari"
			-- Open revision list
			set the URL of the front document to base_url & "/posts/" & post_id & "/revisions"
			delay 2
			-- Find revisions
			set revisions to find text "(/revisions/[\\dabcdef-]+/view-source)" as string in (get source of document 1) using "\\1" with all occurrences, regexp and string result
		end tell
		repeat with i from 1 to number of items in revisions
			set revision to base_url & item i of revisions
			tell application "Safari"
				-- Download revision
				set the URL of the front document to revision
				delay 2
				set myContents to (get source of document 1)
				-- Get relevant portion of content
				set AppleScript's text item delimiters to beginOfCode
				set theArray to every text item of myContents
				if length of theArray > 1 then
					set myContents to item 2 of theArray
				end if
				set AppleScript's text item delimiters to endOfCode
				set theArray to every text item of myContents
				if length of theArray > 0 then
					set myContents to item 1 of theArray
				end if
				set AppleScript's text item delimiters to ""
			end tell
			-- Save contents
			set filename to theFolder & post_id & "-" & i & ".md"
			set newFile to POSIX file filename
			open for access newFile with write permission
			write myContents to newFile
			close access newFile
		end repeat
	end if
end repeat
