module DateCommands
  ( getCurrentDate,
    getCurrentDateWithDay,
  )
where

import Data.Time

hungarianTimeLocale :: TimeLocale
hungarianTimeLocale =
  TimeLocale
    { wDays =
        [ ("vasárnap", "v"),
          ("hétfő", "h"),
          ("kedd", "k"),
          ("szerda", "sze"),
          ("csütörtök", "cs"),
          ("péntek", "p"),
          ("szombat", "szo")
        ],
      months =
        [ ("január", "jan"),
          ("február", "feb"),
          ("március", "már"),
          ("április", "ápr"),
          ("május", "máj"),
          ("június", "jún"),
          ("július", "júl"),
          ("augusztus", "aug"),
          ("szeptember", "szep"),
          ("október", "okt"),
          ("november", "nov"),
          ("december", "dec")
        ],
      amPm = ("de", "du"),
      dateTimeFmt = "%Y-%m-%d, %H:%M:%S",
      dateFmt = "%Y-%m-%d",
      timeFmt = "%H:%M:%S",
      time12Fmt = "%I:%M:%S %p",
      knownTimeZones = []
    }

getCurrentDateInFormat :: String -> IO String
getCurrentDateInFormat format = getCurrentTime >>= return . formatTime hungarianTimeLocale format

getCurrentDate :: IO String
getCurrentDate = getCurrentDateInFormat "%Y-%m-%d"

getCurrentDateWithDay :: IO String
getCurrentDateWithDay = getCurrentDateInFormat "%Y-%m-%d, %A"
