Food ← {
  i ← •rand.Range∘≠⊸⊑((0=⊢)/○⥊↕∘≢)𝕩
  (2+2×0=•rand.Range 10)⌾(i⊸⊑)𝕩
}
_dir ← {
  'w'_𝕣:<˘⍉;
  'a'_𝕣:<˘;
  's'_𝕣:<∘⌽˘⍉;
  'd'_𝕣:<∘⌽˘;
  ("invalid input "∾𝕗)!0
}
Move ← {
  slide ← 4↑0⊸≠⊸/𝕩
  i ← <`=´˘2↕slide
  4↑(¬0∾i)/2⊸×⌾((i∾0)⊸/)slide
}
Gravity ← {Move¨⌾(𝕨_dir)𝕩}
Tick ← Food⍟(∨´0=⥊)Gravity
Live ← {∨´(𝕩≢Gravity⟜𝕩)¨"wasd"}

b ← Food⍟2 4‿4⥊0
{
  •Show 𝕩
  •Out "enter key (wasd)"
  c ← ⊑•GetLine@
  c Tick 𝕩
} •_while_ Live b
•Out "game over"
•Out "you "∾((∨´2048≤⥊b)⊑"lost"‿"won")
