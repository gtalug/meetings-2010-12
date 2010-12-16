(import
 '(java.awt Color Graphics Dimension)
 '(javax.swing JPanel JFrame))

(use 'clojure.contrib.complex-numbers
     'clojure.contrib.generic.arithmetic
     'clojure.contrib.generic.math-functions)

(defn make-panel [w h render]
  (doto (proxy [JPanel] []
	  (paint [#^Graphics g] (render g)))
    (.setPreferredSize (Dimension. w h))))

(defn make-frame [& panel-args]
  (doto (JFrame.)
    (.add (apply make-panel panel-args))
    .pack
    .show))

; Returns the number of iterations for |z| to exceed 2
; or nil if it never does.
(defn num-mandelbrot-iterations [#^complex c max-iter]
  (loop [z (complex 0.0 0.0) num-iter 0]
    (if (> num-iter max-iter)
      nil
      (if (> (abs z) 2.0)
	num-iter
	(recur (+ (* z z) c) (inc num-iter))))))

(defn mandelbrot []
  (make-frame 768 512
	      (fn [#^Graphics g]
		(doseq [x (range 768) y (range 512)]
		  (let [num-iter (num-mandelbrot-iterations (complex (+ (/ x 256.0) -2.0)
								     (+ (/ y 256.0) -1.0))
							    30)]
		    (.setColor g (Color. (if (nil? num-iter) 0 (* num-iter 8)) 0 0))
		    (.fillRect g x y 1 1))))))
