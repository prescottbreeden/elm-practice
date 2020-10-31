module Status exposing(..)

import Html
import List
import Header as H

checkStatus : Int -> String
checkStatus num = 
  if num == 200 then
    "200 OK"
  else if num == 404 then
    "Page not found"
  else
    "Whoa mang..."

statusChecks : List String
statusChecks =
  [ checkStatus 200
  , checkStatus 404
  , checkStatus 418
  ]

status = statusChecks
