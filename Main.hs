-- Trabalho 1 de Haskell
-- Nome: Fernando Kalikosque Laydner Júnior

import Text.Printf

type Triplet = (Float, Float, Float)
type Tuplet = (Float,Float)
type Rect = (Tuplet, Tuplet, Float, String)

-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

strColor :: Triplet -> String
strColor (r,g,b) = "rgb(" ++ show r ++ "," ++ show g ++ "," ++ show b ++ ")"

styled :: Triplet -> Int -> Triplet -> String
styled fill w stroke = "fill:" ++ strColor fill ++ ";stroke-width:" ++ show w ++ ";stroke:" ++ strColor stroke

angles :: Triplet -> String
angles (x,y,z) = (show x) ++ "," ++ show y ++ "," ++ show z

svgRect :: Tuplet -> Tuplet -> Float -> String -> String
svgRect (x, y) (w, h) angle style = printf "<rect x='%.f' y='%.f' width='%.f' height='%.f' transform='rotate(%s)' style='%s' />\n" x y w h (angles (angle, (x+w/2), (y+h))) style

branch ::  Int -> Tuplet -> Tuplet -> Float -> String -> String
branch stop (x, y) (w, h) angle style = (svgRect ((x + w*0.15), (y - h*0.8)) ((w*0.8), (h*0.8)) (angle + 20) style) ++ (svgRect ((x - w*0.4), (y - h*0.8)) ((w*0.8), (h*0.8)) (angle - 20) style) ++ if stop > 0 then (branch (stop - 1) ((x - w*0.6), (y - h*0.8)) ((w*0.8), (h*0.8)) (angle + 20) style) else ""

svgRect2 :: Rect -> String
svgRect2 ((x, y), (w, h), angle, style) = printf "<rect x='%.f' y='%.f' width='%.f' height='%.f' transform='rotate(%s)' style='%s' />\n" x y w h (angles (angle, (x+w/2), (y+h))) style


createRects :: [Rect] -> String
createRects x = concat( map (\rect -> svgRect2 rect) x )


-- Mudar Cores, quantidade de retangulos, dimensão dos retangulos, angulo inicial
svgAll :: String
svgAll = 
  svgBegin 1000 1000 ++  
  (svgRect (500, 500) (50, 100) 100 (styled (55,155,0) 3 (150,100,55)))++ 
  (branch 20 (500, 500) (50, 100) 100 (styled (155,15,55) 1 (0 ,0,255)))++
  (createRects [((575, 575), (50,100), 100, (styled (155,15,55) 1 (0 ,0,255)))])++
  svgEnd

main :: IO ()
main = do
  writeFile "Flying_Pages.svg" svgAll