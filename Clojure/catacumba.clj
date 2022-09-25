(require '[catacumba.core :as ct])

(def app
  (ct/routes [[:all "" example-handler]
              [:get "foobar" example-handler]]))