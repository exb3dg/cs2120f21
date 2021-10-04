/-
chameleon 
exb3dg; https://github.com/exb3dg/cs2120f21.git
-/

/-
Prove the following simple logical conjectures.
Give a formal and an English proof of each one.
Your English language proofs should be complete
in the sense that they identify all the axioms
and/or theorems that you use.
-/

/- true as defined in lean is true.intro -/
example : true := true.intro

-- no proof because it is false, there can't proofs of it or it would be "true"
example : false := _    -- trick question? why?

/- Assuming that P ∨ P exists and both P and P exist by the reflective property 
of if and only if, P ∨ P implies P if and only if P also implies P ∨ P. Meaninng 
P implies P if and only if P also implies P.
 -/
example : ∀ (P : Prop), P ∨ P ↔ P := 
begin
  assume P : Prop,
	apply iff.intro _  _,
	-- forward direction
    assume porp, 
    apply or.elim porp,
		-- left disjunct Is true
		assume p, 
		exact p,
		-- right disjunct is true
		assume p,
		exact p,
	-- backward direction
	assume p,
	exact or.intro_right P p,
end

/- Assuming that P ∧ P and P exist by the reflective property of if and only if, 
P ∧ P implies P if and only if P also implies P ∧ P. -/
example : ∀ (P : Prop), P ∧ P ↔ P := 
begin
  assume P : Prop,
	apply iff.intro _ _,
    assume pandp,
    apply and.elim_left pandp,
    assume p,
    apply and.intro p p,
end

/- Assuming that P ∨ Q and P and Q exist by the reflective property of if and only if, 
P ∨ Q implies Q ∨ P if and only if Q ∨ P also implies P ∨ Q. -/
example : ∀ (P Q : Prop), P ∨ Q ↔ Q ∨ P := 
begin
  assume P Q : Prop, 
  apply iff.intro _ _,
    assume porq,
    apply or.elim porq,
    assume p,
    apply or.swap porq,
    assume q,
    apply or.symm porq,
    assume qorp,
    apply or.symm qorp,
end

/- Assuming that P ∧ Q and P and Q exist by the reflective property of if and only if, 
P ∧ Q implies Q ∧ P if and only if Q ∧ P also implies P ∧ Q. -/
example : ∀ (P Q : Prop), P ∧ Q ↔ Q ∧ P := 
begin
  assume P Q : Prop, 
  apply iff.intro _ _,
    assume pandq,
    apply and.elim pandq,
    assume p q,
    apply and.symm pandq,
    assume qandp,
    apply and.symm qandp,
end

/- Assuming that P ∧ (Q ∨ P) and P, Q, R exist by the distributive property of ∧ 
P ∧ (Q ∨ R) = (P ∧ Q) ∨ (P ∧ R). By the reflective property of if and only if
P ∧ (Q ∨ R) implies (P ∧ Q) ∨ (P ∧ R) only if (P ∧ Q) ∨ (P ∧ R) also implies P
P ∧ (Q ∨ R) -/
example : ∀ (P Q R : Prop), P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R) := 
begin
  assume P Q R : Prop,
  apply iff.intro _ _,
    assume Pqr,
    apply and.elim Pqr,
    assume p qorr,
    apply or.intro_right,
    
    --apply or.elim qorr,
    --assume q,
    --apply and.intro p,
    


  --***incomplete***

end

/- Assuming that P ∨ (Q ∧ R) and P, Q, R exist by the distributive property of ∨  
P ∨ (Q ∧ R) = (P ∨ Q) ∧ (P ∨ R). By the reflective property of if and only if
P ∨ (Q ∧ R) implies (P ∨ Q) ∧ (P ∨ R), (P ∨ Q) ∧ (P ∨ R) also implies P ∨ (Q ∧ R) -/
example : ∀ (P Q R : Prop), P ∨ (Q ∧ R) ↔ (P ∨ Q) ∧ (P ∨ R) := 
begin
  assume P Q R,
  apply iff.intro _ _,
    assume Pqr,
    apply or.elim Pqr,
    assume p,
    apply or.elim (or.swap Pqr),
    assume qandr,
    apply and.elim qandr,
    assume q r,   
    sorry,
    assume p,
    sorry,
    sorry,
    sorry,
end

/- Assuming that P ∧ (P ∨ Q) and P and Q exist by the reflective property of if and 
only if P ∧ (P ∨ Q) implies P, P also implies P ∧ (P ∨ Q) -/
example : ∀ (P Q : Prop), P ∧ (P ∨ Q) ↔ P := 
begin
  assume P Q : Prop,
  apply iff.intro _ _,
    assume Ppq,
    apply and.elim Ppq,
    assume p,
    assume porq,
    apply or.elim porq,
    assume p,
    apply and.elim_left Ppq,
    assume q,
    exact p,
    assume p, 
    apply and.intro p,
    apply or.intro_left,
    exact p,
end

/- Assuming that P ∨ (P ∧ Q) and P and Q exist by the reflective property of if and 
only if P ∨ (P ∧ Q) implies P, P also implies P ∨ (P ∧ Q) -/
example : ∀ (P Q : Prop), P ∨ (P ∧ Q) ↔ P := 
begin
  assume P Q,
  apply iff.intro _ _,
    assume Ppq,
    apply or.elim Ppq,
    assume p,
    exact p,
    assume pandq,
    apply and.elim_left pandq,
    assume p,
    apply or.intro_left,
    exact p,    
end

/- Assuming that P ∨ true and P and true exist by the reflective property of if and 
only if P ∨ true implies true then true must also implie P ∨ true -/
example : ∀ (P : Prop), P ∨ true ↔ true := 
begin
  assume P,
  apply iff.intro _ _,
    assume port,  
    apply or.elim port,
    assume p,
    exact true.intro,
    assume t, 
    exact true.intro,
    assume t,
    exact or.intro_right P t,
end

/- Assuming that P ∨ false and P and false exist by the reflective property of if and 
only if P ∨ false implies P then P must also implies P ∨ false -/
example : ∀ (P : Prop), P ∨ false ↔ P := 
begin
  assume P,
  apply iff.intro _ _,
    assume porf,
    apply or.elim porf,
    assume p,
    exact p,
    assume f, 
    exact false.elim f,
    assume P,
    apply or.intro_left,
    exact P,
end

/- Assuming that P ∧ true and P and true exist by the reflective property of if and 
only if P ∧ true implies P then P must also implies P ∧ true -/
example : ∀ (P : Prop), P ∧ true ↔ P := 
begin
  assume P,
  apply iff.intro _ _,
    assume pandt,
    apply and.elim pandt,
    assume p,
    assume t,
    exact p,
    assume P,
    apply and.intro P true.intro,
end

/- Assuming that P ∧ false and P and false exist by the reflective property of if and 
only if P ∧ false implies false then false must also implies P ∧ false -/
example : ∀ (P : Prop), P ∧ false ↔ false := 
begin
  assume P : Prop,
  apply iff.intro _ _,
    assume pandf,
    apply and.elim pandf,
    assume p,
    assume f, 
    exact f,
    assume f,
    apply and.intro,
    exact false.elim f,
    exact f,
end


