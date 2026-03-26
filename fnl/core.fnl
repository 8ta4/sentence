(local {: ->set
        : concat
        : dec
        : empty?
        : first
        : identity
        : inc
        : last
        : map
        : mapcat
        : reduce} (require :nfnl.core))

(fn find-all* [s pattern hits]
  (let [hit [(string.find s pattern)]]
    (if (empty? hit)
        hits
        (find-all* (->> hit
                        first
                        inc
                        (string.sub s)) pattern
                   (concat hits [(map (if (empty? hits)
                                          identity
                                          (partial + (first (last hits))))
                                      hit)])))))

(fn find-all [s pattern]
  (find-all* s pattern []))

(fn find-line-end [line]
  (first [(string.find line "%S%s*$")]))

(fn comp [...]
  (reduce (lambda [f g]
            (lambda [...]
              (f (g ...)))) identity [...]))

(fn find-punctuated-ends [line]
  (->set (map (comp dec last) (find-all line "[%.%?!][%)%]\"']*%s"))))

(local honorifics ["Mr%." "Dr%." "Mrs%." "Ms%."])

(fn find-honorific-ends [line]
  (->set (mapcat #(map last (find-all line $)) honorifics)))

{}
