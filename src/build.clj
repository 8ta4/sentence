(ns build
  (:require [clojure.java.shell :refer [sh]]))

(defn build
  {:shadow.build/stage :flush}
  [state]
  (sh "nvim" "--headless" "+UpdateRemotePlugins" "+qa!")
  state)