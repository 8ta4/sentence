(local core (require :nfnl.core))

(fn find-all* [s pattern hits]
  (let [hit [(string.find s pattern)]]
    (if (core.empty? hit)
        hits
        (find-all* (string.sub s (core.inc (core.first hit))) pattern
                   (core.concat hits
                                [(core.map (if (core.empty? hits)
                                               core.identity
                                               (partial +
                                                        (core.first (core.last hits))))
                                           hit)])))))

(fn find-all [s pattern]
  (find-all* s pattern []))

{}
