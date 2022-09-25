(page "index.html")

(ns ^{:hoplon/page "index.html"} pages.index
  (:require [hoplon.core  :as h :refer [div ul li html head title body h1 span p button text]]
            [javelin.core :as j :refer [cell cell=]]
            [hoplon.jquery]))

(defn my-list [& items]
  (div
    :class "my-list"
    (apply ul (map #(li (div :class "my-list-item" %)) items))))

(def clicks (cell 0))

(html
  (head
    (title "example page"))
  (body
    (h1 "Hello, Hoplon")

    (my-list
      (span "first thing")
      (span "second thing"))

    (p (text "You've clicked ~{clicks} times, so far."))
    (button :click #(swap! clicks inc) "click me")))