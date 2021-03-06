; arbitrary size tic-tac-toe board; check the state of the game

(defn transpose [mat] (apply (partial map vector) mat))
;transpose + reverse each row
(defn rotate [mat] (mapv #(vec (rseq %)) (transpose mat)))

(defn get-diag [mat] (map #(%1 %2) mat (range)))

(defn check-row [row n] (apply = n row))

(defn check-diag [mat n] (check-row (get-diag mat) n))

(defn has0 [mat] (some #(some zero? %) mat))

(defn check-row-and-diag [board n]
  (or (some #(check-row % n) board)
      (check-diag board n)))

(defn is-solved-for-num [board n]
  (or (check-row-and-diag board n)
      (check-row-and-diag (rotate board) n)))

(defn is-solved [board]
  (cond
    (is-solved-for-num board 1) 1 ;1 wins
    (is-solved-for-num board 2) 2 ;2 wins
    (has0 board) -1 ;unfinished
    :else 0)) ;draw

;=============

(def test1 [[0 1 1]
            [0 1 0]
            [1 2 2]])

(def test2 [[2 1 1]
             [2 1 0]
             [2 0 2]])

(def test3 [[0 1 1]
             [0 1 0]
             [2 0 2]])

(def test4 [[2 1 1]
             [1 1 2]
             [2 2 1]])

(def test5 [[2 1 1 0]
            [1 1 2 0]
            [2 1 1 0]
            [1 1 1 1]])

(def test6 [[2]])

(assert (= (is-solved test1) 1))
(assert (= (is-solved test2) 2))
(assert (= (is-solved test3) -1))
(assert (= (is-solved test4) 0))
(assert (= (is-solved test5) 1))
(assert (= (is-solved test6) 2))
