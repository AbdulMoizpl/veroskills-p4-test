{-# LANGUAGE TypeFamilies           #-}
{-# LANGUAGE TypeOperators          #-}

-- | @since 0.14.1
module Servant.Server.Generic (
                 (Proxy (..))

import           Servant.Server
import           Servant.API.Generic
import           Servant.Server.Internaldata User = User { name :: String, email :: String }
   deriving (Eq, Show, Read, Generic)

instance ToJSON User
instance ToJWT User
instance FromJSON User
instance FromJWT User

data Login = Login { username :: String, password :: String }
   deriving (Eq, Show, Read, Generic)

instance ToJSON Login
instance FromJSON Login

type Protected
   = "name" :> Get '[JSON] String
 :<|> "email" :> Get '[JSON] String


-- | 'Protected' will be protected by 'auths', which we still have to specify.
protected :: Servant.Auth.Server.AuthResult User -> Server Protected
-- If we get an "Authenticated v", we can trust the information in v, since
-- it was signed by a key we trust.
protected (Servant.Auth.Server.Authenticated user) = return (name user) :<|> return (email user)
-- Otherwise, we return a 401.
protected _ = throwAll err401

type Unprotected =
 "login"
     :> ReqBody '[JSON] Login
     :> Verb 'POST 204 '[JSON] (Headers '[ Header "Set-Cookie" SetCookie
                                         , Header "Set-Cookie" SetCookie]
                                         NoContent)
  :<|> Raw

unprotected :: CookieSettings -> JWTSettings -> Server Unprotected
unprotected cs jwts = checkCreds cs jwts :<|> serveDirectory "example/static"

type API auths = (Servant.Auth.Server.Auth auths User :> Protected) :<|> Unprotected

server :: CookieSettings -> JWTSettings -> Server (API auths)
server cs jwts = protected :<|> unprotected cs jwts