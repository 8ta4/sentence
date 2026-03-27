(local {: concat} (require :nfnl.core))

(fn snoc [xs x]
  (concat xs [x]))

{: snoc}
