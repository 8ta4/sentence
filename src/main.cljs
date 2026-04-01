(ns main)

(def state
  (atom nil))

(defn snoc [xs x]
  (concat xs [x]))

(defn main
  [plugin]
  (reset! state plugin)
  (.registerFunction plugin "Get" (fn [])))