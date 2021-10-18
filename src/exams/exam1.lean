/- 
   *******************************
   PART 1 of 2: AXIOMS [50 points]
   *******************************
-/

/-
Explain the inference (introduction and
elimination) rules of predicate logic as
directed below. To give you guidance on
how to answer these questions we include
answers for some questions.
-/


-- -------------------------------------

/- #1: → implies [5 points]

INTRODUCTION

Explain the introduction rule for →. 

[We give you the answer here.]

In English: Given propositions, P and Q, 
a derivation (computation) a proof of Q 
from any proof of P, is a proof of P → Q.

In constructive logic, a derivation is a
given as a function definition. A proof
of P → Q literally is a function, that,
when given any proof of P as an argument
returns a proof of Q. If you define such
a function, you have proved P → Q.

ELIMINATION

Complete the definition of the elimination
rule for →.

(P Q : Prop) (p2q : P → Q) (p : P)
---------------------------------- → elim
     q : Q
-/

-- Give a formal proof of the following
example : ∀ (P Q : Prop) (p2q : P → Q) (p : P), Q :=
begin
  assume P Q p2q p,
  apply p2q p,
end

-- Extra credit [2 points]. Who invented this principle?
-- Aristotle?


-- -------------------------------------


/- #2: true [5 points]

INTRODUCTION

Give the introduction rule for true using
inference rule notation.

[Here's our answer.]

---------- intro
(pf: true)

Give a brief English language explanation of
the introduction rule for true.

In English: 
The introduction rule for true assumes that 
whatever proposition that the rule is applied to 
is unconditionally true with the proof true.intro.

ELIMINATION

Give an English language description of the
elimination rule for true.

[Our answer]

A proof of true carries no information so
there's no use for an elimination rule.
-/

-- Give a formal proof of the following:

example : true := true.intro


-- -------------------------------------

/- #3: ∧ - and [10 points]

INTRODUCTION

Using inference rule notation, give the 
introduction rule for ∧.

[Our answer]

(P Q : Prop) (p : P) (q : Q)
---------------------------- intro
        (pq : P ∧ Q)

Give an English language description of
this inference rule. What does it really
say, in plain simple English. 

In English: Given propositions, P and Q, 
and an object p with proposition P 
and an object q with proposition Q, 
 you have both propostions P and Q.


ELIMINATION

Give the elimination rules for ∧ in both
inference rule and English language forms.
-/

/-
(P Q : Prop) (pq : P ∧ Q)
------------------------- ∧ elim (left)
          p : P
In English: Given propositions, P and Q, 
and proof of pq (P ∧ Q), using the elimination
rule and.elim_left on pq will give a proof of p.

(P Q : Prop) (pq : P ∧ Q)
------------------------- ∧ elim (right)
          q : Q
In English: Given propositions, P and Q, 
and proof of pq (P ∧ Q), using the elimination
rule and.elim_right on pq will give a proof of Q.
-/

/-
Formally state and prove the theorem that, 
for any propositions P and Q,  Q ∧ P → P.
-/

example: ∀ (P Q : Prop), Q ∧ P → P := 
begin
    /-
  Given any Property P and Q, with a proof of 
  Q ∧ P, you can then get a proof of P using 
  the elimination rule and.elim_right on Q ∧ P.
  -/
  assume P Q qAp,
  apply and.elim_right qAp,
end



-- -------------------------------------

/- #4: ∀ - for all [10 points]

INTRODUCTION

Explain in English the introduction rule for ∀. If 
T is any type (such as nat) and Q is any proposition 
(often in the form of a predicate on values of the
given type), how do you prove ∀ (t : T), Q? What is
the introduction rule for ∀?

In English: 
Assume you have an arbitrary t of any type T where the 
proposition Q is applied. Because t can be any value 
the result of applying the propostion Q can be applied 
to all t's because the t given was arbitrary--it could 
have been any t.


ELIMINATION

Here's an inference rule representation of the elim
rule for ∀. First, complete the inference rule by
filling in the bottom half, then Explain in English
what it says.

(T : Type) (Q : Prop), (pf : ∀ (t : T), Q) (t : T)
-------------------------------------------------- elim
                q : Q

In English:
Given a proposition Q, a proof (pf : ∀ (t : T), Q), 
and value t of any Type T. You know that for all t 
of type T the proposition Q is true. 

Given a proof, (pf : ∀ (t : T), Q), and a value, (t : T),
briefly explain in English how you *use* pf to derive a
proof of Q.

In English:
To show this you apply/use the proof pf on t which then 
yields a proof of Q.
-/

/-
Consider the following assumptions, and then in the
context of these assumptions, given answers to the
challenge problems.
-/

axioms
  (Person : Type)
  (KnowsLogic BetterComputerScientist : Person → Prop)
  (LogicMakesYouBetterAtCS: 
    ∀ (p : Person), KnowsLogic p → BetterComputerScientist p)
  -- formalizee the following assumptions here
  -- (1) Lynn is a person
  -- (2) Lynn knows logic
  -- (3) From logic makes you better at CS. If a person knows 
  --     logic than they are a better computer scientist
  -- (4) Therefore because Lynn knows logicm she is a better
  --     computer scientist.

/-
Now, formally state and prove the proposition that
Lynn is a better computer scientist
-/
example : ∀ (p : Person), KnowsLogic p → BetterComputerScientist p :=
begin
 assume p,
 assume pKnowsLogic,
 apply LogicMakesYouBetterAtCS,
 exact pKnowsLogic,
end

-- -------------------------------------

/- #5: ¬ - not [10 points] 

The ¬ connective in Lean is short for *not*. Give
the short formal definition of ¬ in Lean. Note that
surround the place where you give your answer with
a namespace. This is just to avoid conflicting with
Lean's definition of not.
-/

namespace hidden
def not (P : Prop) :=  -- fill in the placeholder
  ∀ (P : Prop), P → false
end hidden

/-
Explain precisely in English the "proof strategy"
of "proof by negation." Explain how one uses this
strategy to prove a proposition, ¬P. 
-/

/-
In English: 
To prove that ¬P is true, assume P is true and show 
that this leads to a contradiction. P → false, 
therefore this indirectly proves ¬P is true. 
-/

/-
Explain precisely in English the "proof strategy"
of "proof by contradiction." Explain how one uses
this strategy to prove a proposition, P (notice 
the lack of a ¬ in front of the P). 

In English:
To prove P is true, assume ¬P and show that this
assumption leads to a contradiction. That prove
¬¬P which you can then use negation elimination
to infer P from ¬¬P.

Fill in the blanks the following partial answer:

To prove P, assume ¬P and show that you can derive 
a contradiction. From this derivation you can conclude 
¬P is false. Then you apply the rule of negation 
elimination to that result to arrive a proof of P. 
We have seen that the inference rule you apply in the 
last step is not constructively valid but that it
is universally valid, and that accepting the axiom
of the negation suffices to establish negation
elimination (better called double negation)
as a theorem.


-/

-- -------------------------------------

/- 
#6: ↔ - if and only if, equivalent to [10 points]
-/

/-
ELIMINATION 

As with ∧, ↔ has two elimination rules. You can 
see their statements here.
-/
#check @iff.elim_left
#check @iff.elim_right

/-
Formally state and prove the theorem that 
biimplication, ↔, is *commutative*. Note: 
put parentheses around each ↔ proposition,
as → has higher precedence than ↔. Recall
that iff has both elim_left and elim_right
rules, just like ∧.
-/

example : ∀ ( P Q : Prop), P ↔ Q :=
/-
For all properties P and Q, P is true if and 
only if Q is true. By the commutative property
of ↔, this means Q is true iff P is also true.
-/
begin
  assume P Q,
  split,
  -- forward
  assume p,
  apply or.elim (classical.em Q),
  assume q,
  exact q,
  assume nq,
  sorry,
  admit, -- assuming that the reverse is true
end


/- 
   ************************************************
   PART 2 of 3: PROPOSITIONS AND PROOFS [50 points]
   ************************************************
-/

/- #7 [20 points]

First, give a fluent English rendition of
the following proposition. Note that the
identifier we use, elantp, is short for
"everyone likes a nice, talented person."
Then give a formal proof. Hint: try the
"intros" tactic by itself where you'd
previously have used assume followed by
a list of identifiers. Think about what
each expression means. 

Working out:
Function Nice takes person and returns that
that person is nice.
Function Talented takes a person, a returns 
that that person is talented.
Function Likes takes a person, and returns 
that that person likes the other person.
elantp: For all person p, they are nice and talented 
therefore for all person q, person q likes person p.
JohnLennon is type Person.
JohnLennon is Nice and Talented.
For all person p, they like JohnLennon.

For all person q, they like person p who is nice and talented.
For all person p, they like JohnLennon who is nice and talented.


-/

def ELJL : Prop := 
  ∀ (Person : Type) 
    (Nice : Person → Prop)
    (Talented : Person → Prop)
    (Likes : Person → Person → Prop)
    (elantp : ∀ (p : Person), Nice p → Talented p → ∀ (q : Person), Likes q p) 
    (JohnLennon : Person)
    (JLNT : Nice JohnLennon ∧ Talented JohnLennon),
    (∀ (p : Person), Likes p JohnLennon) 
example : ELJL :=
begin
  intros Person Nice Talented Likes elantp p JLNT q,
  apply elantp p,
  apply and.elim JLNT,
  assume Np Tp,
  exact Np,
  apply and.elim JLNT,
  assume Np Tp,
  exact Tp,
end



/- #8 [10 points]

If every car is either heavy or light, and red or 
blue, and we want a prove by cases that every car 
is rad, then: 

-- how many cases will need to be considered? 4
-- list the cases (informaly)
    -- heavy and red
    -- heavy and blue
    -- light and red
    -- light and blue

-/

/-
  *********
  RELATIONS
  *********
-/


/- #9 [20 points]
Equality can be understood as a binary relation
on objects of a given type. There is a binary 
equality relation on natural numbers, rational 
numbers, on strings, on Booleans, and so forth.

We also saw that from the two axioms (inference
rules) for equality, we could prove that it is
not only reflexive, but also both symmetric and
transitive.

Complete the following definitions to express
the propositions that equality is respectively
symmetric and transitive. (Don't worry about
proving these propositions. We just want you
to write them formally, to show that you what
the terms means.)
-/

def eq_is_symmetric : Prop :=
  ∀ (T : Type) (x y : T), 
  x = y → y = x

def eq_is_transitive : Prop :=
  ∀ (T : Type) (x y z : T ) (xy : x = y) (yz : y = z),
  x = z 

/-
  ************
  EXTRA CREDIT
  ************
-/

/- 
EXTRA CREDIT: State and prove the proposition
that (double) negation elimination is equivalent
to excluded middle. You get 1 point for writing
the correct proposition, 2 points for proving it
in one direction and five points for proving it
both directions. 
-/

def negelim_equiv_exmid : Prop := 
  ∀ (P : Prop), P → ¬¬P
 
example : ∀ (P : Prop), (P → ¬¬P) ↔ (P ∨ ¬P) := 
begin
  assume P,
  apply iff.intro _ _,
  assume pEnnp,
  have pornp := classical.em P,
  exact pornp,
  assume pornp,
  assume p,
  contradiction,
end

/- 
EXTRA CREDIT: Formally express and prove the
proposition that if there is someone everyone
loves, and loves is a symmetric relation, then 
thre is someone who loves everyone. [5 points]
-/

-- Loves everyone someone → Loves someone everyone

axiom Loves : Person → Person → Prop

example : (∃ (p1 : Person), ∀ (p2 : Person), Loves p2 p1) →
-- for all p2 (everyone), they love p1 (someone) who exists
(∀ ( e : Person), ∃ (s : Person), Loves s e)  := 
-- for all e (everyone), there exists s (someone) who loves e (everyone)
begin
  assume h,
  cases h with p1 p2Lp1,
  assume e,
  apply exists.intro p1,
  -- excact (pf e)
  sorry,
end
