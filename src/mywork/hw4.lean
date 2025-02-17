/-
chameleon 
exb3dg; https://github.com/exb3dg/cs2120f21.git
-/

-- 1
example : 0 ≠ 1 :=
begin
  -- ¬ (0 = 1)
  -- (0 = 1) → false
  assume h,
  cases h,
end


-- 2
example : 0 ≠ 0 → 2 = 3 :=
begin
  assume h,
  have f : false := h (eq.refl 0),
  exact false.elim (f),
end

-- 3
example : ∀ (P : Prop), P → ¬¬P :=
begin
  assume P,
  assume (p : P),
  -- ¬¬P
  -- ¬P → false
  -- (P → false) → false
  assume h,
  have f := h p,
  exact f,
end 

-- We might need classical (vs constructive) reasoning 
#check classical.em
open classical
#check em

/-
axiom em : ∀ (p : Prop), p ∨ ¬p

This is the famous and historically controversial
"law" (now axiom) of the excluded middle. It's is
a key to proving many intuitive theorems in logic
and mathematics. But it also leads to giving up on
having evidence *why* something is either true or
not true, in that you no longer need a proof of 
either P or of ¬P to have a proof of P ∨ ¬P.
-/

-- 4
theorem neg_elim : ∀ (P : Prop), ¬¬P → P :=
begin
  assume P,
  assume h,
  have pornp := classical.em P,
  cases pornp with p pn,
  assumption,
  contradiction,
end

-- 5
theorem demorgan_1 : ∀ (P Q : Prop), ¬ (P ∧ Q) ↔ ¬ P ∨ ¬ Q :=
begin
  assume P Q,
  apply iff.intro _ _,
    assume npandnq,
    have pornp := classical.em P,
    apply or.elim (or.swap pornp),
    assume np,
    have qornq := classical.em Q,
    apply or.elim (or.swap qornq),
    assume nq,
    apply or.intro_right,
    exact nq,
    assume q,
    apply or.intro_left,
    assume p,
    have f := np p,
    exact f,
    assume p,
    apply or.intro_right,
    assume q,
    

  --***incomplete***
  
end


-- 6
theorem demorgan_2 : ∀ (P Q : Prop), ¬ (P ∨ Q) → ¬P ∧ ¬Q :=
begin
  assume P,
  assume Q,
  have qornq := classical.em Q,
  cases qornq with q nq,
  have pornp := classical.em P,
  cases pornp with p np,
  
  --***incomplete***
end


-- 7
theorem disappearing_opposite : 
  ∀ (P Q : Prop), P ∨ ¬P ∧ Q ↔ P ∨ Q := 
begin
  assume P Q,
  apply iff.intro _ _,
    have pornp := classical.em P,
    have p : P := or.intro_right pornp,
    
    cases pornp with p np,
    have qornq := classical.em Q,
    --cases qornq with q nq,
    apply or.elim qornq,
    assume q,
    
    have pornpandq : P ∨ ¬P ∧ Q := and.intro (or.intro p np) q,

  

--***incomplete***
end


-- 8
theorem distrib_and_or : 
  ∀ (P Q R: Prop), (P ∨ Q) ∧ (P ∨ R) ↔
                    P ∨ (Q ∧ R) :=
begin
  assume P Q R,
  apply iff.intro _ _,
    have pornp := classical.em P,
    cases pornp with p np,
    have qornq := classical.em Q,
    cases qornq with q nq,
    have rornr := classical.em R,
    cases rornr with r nr,
    --apply or.intro p q,
    --have porq : P ∨ Q := ?,
  

--***incomplete***
end

-- remember or is right associative
-- you need this to know what the lefts and rights are
-- 9
theorem distrib_and_or_foil : 
  ∀ (P Q R S : Prop),
  (P ∨ Q) ∧ (R ∨ S) ↔
  (P ∧ R) ∨ (P ∧ S) ∨ (Q ∧ R) ∨ (Q ∧ S) :=
begin
  intros P Q R S,
  apply iff.intro _ _,
    intros h,
    apply and.elim h,
    assume pOq rOs,
    cases pOq,
    exact p q,
    cases rOs with r s,
    have pAr : P ∧ R := and.intro p r,

    have pAs : P ∧ S := and.intro p s,
     

    --apply or.elim pOq,
    --assume p,
    --apply or.elim pOq,
    --apply or.elim rOs,
    --assume r,

    --apply or.intro_left _ _,
    --apply and.intro p r,
    --assume s,
    --apply or.intro_left _ _,
    
    


    --have pOq : P ∨ Q := and.elim_left h,
    --have p : P := or.assoc pOq,
    
    /-
    have pornp := classical.em P,
    cases pornp with p np,
    have qornq := classical.em Q,
    cases qornq with q nq,
    have rornr := classical.em R,
    cases rornr with r nr,
    have sorns := classical.em S,
    cases sorns with s ns,
    have porq : P ∨ Q := or.intro p q,
    have rors : R ∨ S := or.intro r s,
    -/

--***incomplete***
end


/- 10
Formally state and prove the proposition that
not every natural number is equal to zero.
-/
lemma not_all_nats_are_zero : ¬ (∀ n : ℕ, n = 0) :=
begin
  assume n, 
  contradiction,

  
end 

-- 11. equivalence of P→Q and (¬P∨Q)
example : ∀ (P Q : Prop), (P → Q) ↔ (¬P ∨ Q) :=
begin
  assume P Q,
  apply iff.intro _ _,
    assume pimq,
    sorry,
    assume p, 
    sorry,

end

-- 12
example : ∀ (P Q : Prop), (P → Q) → (¬ Q → ¬ P) :=
begin
  assume (P Q : Prop),
  assume pimq,
  assume nq,
  assume p,
  sorry,
end

-- 13
example : ∀ (P Q : Prop), ( ¬P → ¬Q) → (Q → P) :=
begin
  assume P Q,
  assume npimnq,
  assume q,
  sorry,
end

example : ∀ (P Q : Prop), ( ¬P → ¬Q) → (Q → P) :=
begin
  assume P Q h,
  cases (em P) with p np,
  assume q,
  assumption,
  assume q,
  have nq := h np,
  contradiction,
end

