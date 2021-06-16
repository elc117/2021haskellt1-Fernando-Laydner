


O trabalho usa como base o programa da quarta pratica com haskell. Inicialmente a ideia era realizar uma arvore fractal, mas devido a complexidade de fazer rotacionar objetos em svg, de não ser essa a finalidade do trabalho e por provavelmente levar a ser hard-coded, acabei tentando focar mais em haskell. A imagem pode ser mexida com alterações nos valores de svgAll, assim como em algumas outras funções como a função branch, que pode alterar o angulo, e outros parametros basicos dos retangulos.

svgRect -> Função inicial usada para desenhar os retangulos. Recebe 2 Tuplets, que definem o ponto e as dimensões do objeto, o angulo do objeto e o estilo do objeto.

branch -> Função recusiva com um criterio de parada que executa a função svgRect.

createRects -> Ideia secundária com uma abordagem diferente que possivelmente teria facilitado a criação de padrões mais interessantes, pois facilitaria focar mais em uma abordagem matemática para posição dos Retangulos, porém não tive muito tempo para desenvolver ela mais a fundo.

svgRect2 -> Recebe uma lista de Rect e retorna uma lista com os retangulos em svg, funcionando em conjunto com createRects para uma abordagem diferente.

angles -> Função responsavel por colocar os angulos no padrão correto de escrita para não sobrecarregar a quantidade de argumentos que svgRect deveria receber.

styled -> Função responsavel por colocar o estilo no padrão correto de escrita para não sobrecarregar a quantidade de argumentos que svgRect deveria receber.

strColor -> Função responsavel por criar para colocar cada cor no padrão correto de escrita para não sobrecarregar a quantidade de argumentos que svgRect deveria receber.

Restante das funções foram retiradas do atividade 4, e funcionam extamente da mesma forma.