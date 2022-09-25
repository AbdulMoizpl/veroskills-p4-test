import           JavaScript.Web.XMLHttpRequest

import           Miso                          hiding (defaultOptions)
import           Miso.String

-- | Model
data Model
  = Model
  { info :: Maybe APIInfo
  } deriving (Eq, Show)