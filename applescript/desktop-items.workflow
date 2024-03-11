property theSpacingFactor : 0.8
property theGutterXFactor : 1.57
property theGutterYFactor : 1.57

on rearrangeDesktopIcons()
	tell application "Finder"
		tell icon view options of window of desktop
			set theArrangement to arrangement
			set theArrangementString to theArrangement as string
			if {"not arranged", "«constant ****narr»", "snap to grid", "«constant ****grda»"} does not contain theArrangementString then
				display alert "\"Rearrange Desktop Icons\" AppleScript says:" message "Cannot rearrange Desktop items, please change Desktop \"Sort by\" to \"None\" or \"Snap to Grid\"." giving up after 10
				return
			end if
			set theIconSize to icon size
			set theLabelSize to text size
		end tell
		
		set theDesktopBounds to bounds of window of desktop
		set theDesktopWidth to item 3 of theDesktopBounds
		set theDesktopHeight to item 4 of theDesktopBounds
		
		
		
		
		set DesktopItems to every item of desktop
		
		set theDesktopItems to reverse of (sort DesktopItems by size)
		set theDesktopItems to sort DesktopItems by modification date
		
		
		
		
		
		set theSpacing to (theIconSize + theLabelSize + (theIconSize / 2)) * theSpacingFactor
		set theGuttersX to theSpacing * theGutterXFactor
		set theGuttersY to theSpacing * theGutterYFactor
		set theMaxColumns to ((theDesktopWidth - theGuttersX * 2) / theSpacing) as integer
		set theMaxRows to ((theDesktopHeight - theGuttersY * 2) / theSpacing) as integer
		set theMaxLocations to theMaxRows * theMaxColumns
		
		set x to 1
		repeat with a from 1 to length of theDesktopItems
			set y to a mod theMaxRows
			if y is 0 then
				set y to theMaxRows
			end if
			
			if a is greater than theMaxLocations then
				set desktop position of item a of theDesktopItems to {theGuttersX, theGuttersY}
			else
				set desktop position of item a of theDesktopItems to {theGuttersX + (x - 1) * theSpacing * 2.3, theGuttersY + (y - 1) * theSpacing}
			end if
			
			if a mod theMaxRows is 0 then
				set x to x + 1
			end if
		end repeat
	end tell
end rearrangeDesktopIcons

on adding folder items to alias after receiving listOfAlias
	rearrangeDesktopIcons()
end adding folder items to

on removing folder items from alias after losing listOfAliasOrText
	rearrangeDesktopIcons()
end removing folder items from

rearrangeDesktopIcons()
