/- 
*Lecture 1*
- Reasoning
-- Inductive: derive generalized predictive models from given sets of observations
-- Abductive: guess a hypothysis based on given information, test and adjust accordingly
-- Deductive: Assume that certain given propositions (axioms) are true (or have proofs)
    - Combine truths/proofs of smaller propositions into truths/proofs of bigger ones
      - Formal rules of inference define how truth or proof values can be combined
      - Examples:
        - If you know propositions P, Q, are true, you can deduce "P AND Q" is too
        - If you have proofs of P, Q, you can construct a bigger proof: of "P AND Q"


- Reflexive Axiom of Equality
-- every object, t, of every type, T, is equal to itself
* lean → ∀ (T : Type) (t : T), t = t 

- Number Systems 
ℕ: Natural numbers. The non-negative whole numbers. {0, 1, 2, ...}
ℤ: Integers: The negative and non-negative whole numbers. 
ℚ: Rationals: Ratios of an integer and a non-zero natural number.
ℝ: Reals: Equivalence classes of convergent sequence of rationals.
Irrational numbers: Real numbers not "isomorphic" to any rationals.

* def q : ℚ := 1/1
Each proceeding line of code has the following elements
-- def: a keyword, binds the given identifer to the given value
-- n, m, z, r, q: identifiers, a.k.a., variables or variable names
-- : T, where T is ℕ, ℤ, ℝ, or ℚ: specifies the *type* of the value
-- := 1.0: specifies the value, 1.0, to be bound to the identifier
* def q' := 1/1 -- assumues *type* 

- formal proof
example : 1 = 1 := 
  eq.refl 1 --> eq.refl 1 is an object that serves as proof of 1 = 1
QED

- Axioms, Propositions, Proofs
-- Formal proof that 1 =1 
example : 1 = 1 := 
  eq.refl 1   -- Lean inferns T = ℕ from 1
-- English proof
Proof: By the reflexive property of equality 1 = 1

-- Lean is not just for formalizing mathematics and logic, but 
for checking that proofs *truly* prove what they claim to prove. 

- QED, is short for quod est demonstratum, Latin for "it is shown."
- applying an arguement (function: def) --> #reduce


*Lecture 2*
- Equality 
Equality is defined for all objects of all types
by just two inference rules, which we accept as
axioms. 
-- the axiom of the *reflexivity of equality* * Equality is a reflexive relation
-- the axiom of the *substitutability of equals*
use these two axioms to construct proofs of two theorems about equality:
-- theorem: the equality relation is *symmetric*
-- theorem: the equality relation is *transitive*
 
- Propositions
- A proposition is a claim that can be judged to be true or not.
Example: CVille is a city in Virginia
-- a false proposition has no proofs (else it'd be true!)

- Predicates 
- ("function that takes values as arguments and returns a proposistion")
A predicate is a parameterized proposition. In other words,
it is a proposition with some *arguments*, which is to say,
slots where you can fill in values of specified types.
Predicate P: _X_ is a city in Virginia
-- You can then *apply* either predicate,
P or Q, to a string to get a resulting proposition.
-- For example, (Q "Kevin") produces the proposition,
Kevin Sullivan is from Charlottesville, while (e3 2)
produces the proposition 2 = 3. 

- Predicates as functions
A predicate can be represented a exactly as a function
i.e. def e3 (n : nat ) : Prop := n = 3
-- the finction yields a proposition that the given n = 3

- Using proofs of equality (elimination rulle)
axiom of *substitutability* gives us a license to *rewrite* 
propositions by replacing one term with another as long as 
we can prove a proof of equality as an argument.

``` lean
axiom eq_subst :  
  ∀ (T : Type)      
    (P : T → Prop)  
    (x y : T)       
    (e : x = y)     
    (px : P x),     
  P y              
```
- Transitivity
If x, y, and z are objects of some type, T, and we
know (have proofs or axioms) that x = y and y = z,
then we can deduce (and have a proof) that x = z.

theorem eq_trans : 
  ∀ (T : Type) 
    (x y z : T) 
    (e1 : x = y) 
    (e2 : y = z), 
  x = z :=
begin
  assume (T : Type), -- take as temporary axiom!
  assume (x y z : T), -- another one: context!
  assume (e1 : x = y),
  assume (e2 : y = z),
  rw e1,
  rw e2,      -- eq.refl applied automatically
end

def rel_transitive :=
  ∀ (x y z : T), (R x y) → (R y z) → (R x z)

- INFERENCE RULE #1/2: EQUALITY IS REFLEXIVE
axiom eq_refl  : 
  ∀ (T : Type)  -- if T is any type (of thing)
    (t : T),    -- and t is thing of that type, T
  t = t         -- the result type: proof of t = t

def rel_reflexive := ∀ (x : T), (R x x)
def rel_symmetric := ∀ (x y : T), (R x y) → (R y x)

- INFERENCE RULE #2/2: SUBSTITUTION OF EQUALS FOR EQUALS
axiom eq_subst : 
  ∀ (T : Type)      -- if T is a type
    (P : T → Prop)  -- and P is a property of T objects
    (x y : T)       -- and x and y are T objects
    (e : x = y)     -- and you have a proof that x = y
    (px : P x),     -- and you have a proof that x has property P
  P y               -- then you can deduce (and get a proof) of P y

-- Lecture 2 also has theorems on eq_trans and eq_symm




*09/15/2021 Lecture 8*


-- whereever you use exact you can replace it with apply
-- you can't replace apply with exact all the time

-- introduction rules for or *look up *
--> or.intro
--> and.intro
--> or.elim


***Lecture 9***
¬P "not P", means P is false
- if a proposition is false, it means there are no proofs of it
- assume --> is an implication

- exact false.elim
theorem false_elim (P : Prop) (f : false) : P :=
begin
  exact false.elim f,
  or
  case f,
end



***Lecture 5***





***Lecture 9***
example : false → true :=
begin
  assume f,
  case h,
  case h,
  exact true.intro,
end 

example: true ¬ true :=
begin
  assume t,
  case t,
  exact true.intro,
end

example: false ¬ false :=
begin
  assume f,
  case f,
end

ex false quod libet, "false implies anything"

not true, not false, you don't have proof either way

axiom true_or_not_true : ∀ (P : Prop), (P ∨ ¬P)
-/

/-
10/01/2021 Midterm Review



to prove false
1) variable of type false, exact 
2) proof of false, apply false elimination on "a"
3) two variables that that are obviously false 


assumption applies exact to are variables and 

exact takes a proof of what you're trying to prove


exist.intro _ _ → exists.intro "what exists" "a proof"
  i.e. exists.intro 1 eq.refl 1

¬ _
_ → false

¬ is basically a implies statement




∧ 
Inference rules
  and.intro p q
  and.elim_left <p q> → p
  and.elim_right <p q> → q
∧ is communatative
Theorem: ∀ ( P Q : Prop), P ∧ Q ↔ Q ∧ P




-/
