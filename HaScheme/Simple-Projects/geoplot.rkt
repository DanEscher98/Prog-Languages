#lang racket

(require plot plot/utils)
(require json)

(define (lat-lng->unit-vector lat lng)
    (3d-polar->3d-cartesian
        (degrees->radians lng)
        (degrees->radians lat)
        1))

(define (meridian lng)
    (define points
        (for/list ([lat (in-range -90.0 90.0 5.0)])
            (lat-lng->unit-vector lat lng)))
    (lines3d points))

(define unit-sphere
  (polar3d (λ (θ φ) 1.0)
           #:color "navajowhite"
           #:line-style 'transparent
           #:alpha 0.9))

(plot3d (cons unit-sphere 
              (for/list ([lng (in-range -180 180 20)])
                (meridian lng))))

(define world-data (call-with-input-file "./custom.geo.json" read-json))

(define (make-renderers world-map-data)
    (for/fold
        ([renderers '()])
        ([feature (in-list (hash-ref world-map-data 'features))])
    (let* ([geometry (hash-ref feature 'geomery (lambda () (hash)))]
           [data (hash-ref geometry 'coordinates (lambda () null))])
          (case (hash-ref geometry 'type #f)
            (("Polygon") (cons (make-polygon-renderer data) renderers))
            (("MultiPolygon") (cons (for/list ([polygon (in-list data)])
                                      (make-polygon-renderer polygon))
                                    renderers))
            (else (printf "Skipping ~a geometry" (hash-ref geometry 'type #f))
                  renderers)))))

(define (make-polygon-renderer polygons)
  (for/fold ([renderers '()])
            ([polygon (in-list polygons)] #:unless (null? polygon))
    (define points
      (for/list ([point (in-sequences
                         (in-list polygon)
                         (in-value (car polygon)))])
        (match-define (list lng lat _ ...) point)
        (lat-lng->unit-vector lat lng)))
    (cons (lines3d points) renderers)))

(plot3d (list unit-sphere (make-renderers world-data)))

