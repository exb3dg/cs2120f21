/-
prove equality is symmetric using reflextivity and substitution

-/



theorem eq.symm : 
∀ (T : Type ) (x y : T), x = y → y = x := 
begin
  assume (T : Type), 
  assume (x y : T),
  assume (e : x = y),
  rw e,
end 

 /-  
  Theorem: Equallity is symmetric. In other words 
  ∀ (T : Type ) (x y : T), x = y → y = x := 

  Proof: Assume T is of any type and x and y 
  are of type T and assuming x = y. 
  Then using the substituion axiom of equals y = x.
  QED.

  -/

  /- 
  Prove than equality is transitive.

  -/

  theorem eq.trans :
  ∀ (T : Type) (x y z : T), x = y → y = z → x = z :=
  begin
    assume (T : Type),
    assume (x y z : T),
    assume (e1 : x = y),
    assume (e2 : y = z),
    rw e1,
    rw e2,
  end
