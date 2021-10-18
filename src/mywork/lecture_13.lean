/-
UPDATE: Test distributed after class on 
Monday. Monday will be a review day. The
test is due back Wednesday before class.
In class Wednesday we will have at least
a short quiz to sanity check what you will
have submitted for the test. We reserve the
right to do follow-on in-person testing if
the results indicate a possible problem.
-/

/-
REVIEW: Last time we focused on the question, 
how do we construct a proof of ∃ x, P x.  

To do so, you apply the introduction rule for
exists. It's called exists.intro in Lean. You
apply it to two arguments: a specific value, w,
in place of x, and a proof that that particular
w satisfies the predicate, P, i.e., that there 
is a proof of the proposition, P w. 

In other words, you can think of a proof of
∃ x, P x, as a pair, ⟨w, pf ⟩, where w is a
witness and pf is a proof of P w.
-/

/-
Today we'll delve deeper into the mysteries
of exists elimination, or how you can *use*
a proof of ∃ x, P x.

Here's the idea: If you have a proof, ex, of
of ∃ (x : X), P x, you can apply exists.elim
to ex, and (after a few more simple maneuvers)
have yourself a specific value, (w : X), and 
a proof that w satisfies P, i.e., (pf : P w). 
The idea is that you can then uses the values
in your subsequent proof steps.

Why does this rule make sense? Consider a very
simple example. If I tell you there exists some
green ball, you can say, "well, call it b," and
give that we know it's green, we also know that
it satisfies the isGreen _ predicate, so we can
also assume we have a proof of (isGreen b). In
this example, b is a witness to the fact that
some object satisfies the predicate. The proof
then shows for sure that that is so.
-/

example : ∃ (b : bool), b && tt = ff :=
begin
  apply exists.intro ff,
  exact rfl,
end

example : 
  (exists (b : bool), b && tt = ff) → 
  (∃ (b : bool), true) :=
  -- if there exists a bool b and b and true equals false then bool is true
begin
  assume h,
  cases h with w pf,
  apply exists.intro w,
  trivial,
end


/-
Let's set up some assumptions so that 
we can explore their consequences when
it comes to existentially quantified
propositions.
-/

/-
Beachballs! What could be more fun
-/

axioms 
  (Ball : Type)           -- There are balls
  (Green : Ball → Prop)   -- a Ball can be Green
  (Red : Ball → Prop)     -- a Ball can be Red 
  (b1 b2 : Ball)          -- b1 and b2 are balls
  (b1r : Red b1)          -- b1 is red
  (b1g : Green b1)        -- b1 is green
  (b2r : Red b2)          -- b2 is red


example : 
  (∃ (b : Ball), Red b ∧ Green b) → 
  (∃ (b : Ball), Red b) :=
begin
  assume h,
  cases h with ball RaG,
  apply exists.intro ball,
  exact RaG.left,
end 

example : 
  (∃ (b : Ball), Red b ∨ Green b) → 
  (∃ (b : Ball), Green b ∨ Red b) :=
begin
  assume h,
  cases h with ball RoG,
  apply exists.intro ball,
  cases RoG with r g,
  _,

end 

example : 
  (∃ (b : Ball), Red b ∨ Green b) → 
  (∃ (b : Ball), Red b) :=
begin
  assume h,
  cases h with w pf,
  cases pf,
  apply exists.intro w,
  assumption,
  --contradiction,
end 

example : 
    (∃ (b : Ball), Red b) → 
    (∃ (b : Ball), Red b ∨ Green b) := 
begin

end 

/-
Social Networks
-/

axioms
  (Person : Type)
  (Nice : Person → Prop)
  (Likes : Person → Person → Prop)

/-
a person is a type --> a person existd
nice is a function, given a person it'll 
return that person is nice
likes is a function that takes a person, 
it'll return that that person likes that other person
-/
example : 
  (∃ (p1 : Person), ∀ (p2 : Person), Likes p2 p1) → 
  (∀ (e : Person), ∃ (s : Person), Likes e s) :=
/-
there exists a person p1 such that forall person p2, all person p2 likes p1
forall person e, there exists a person s that they like
-/
begin
  assume h, 
  cases h with person1 pf,
  assume e,
  apply exists.intro person1,
  exact (pf e),
end

/-
Write formal expressions for each of the following
English language sentences.
-/

-- Everyone likes him or herself
-- (∀ p : people), Likes p p

-- Someone doesn't like him or herself
-- (∃ p : person), ¬(Likes p p)

-- There is someone who likes someone else
-- (∃ p1 p2: person), Likes p1 p2

-- No one likes anyone who dislikes them
-- ¬(∃ p : person), ∀ (p2 : person), ¬ Nice p2 → LIkes p1 p2

-- Everyone likes anyone who is nice

-- No one likes anyone who is not nice

/-
If everyone who's nice likes someone, then
there is someone whom everyone who is nice 
likes.
-/
-- ((∀ p1 : person), ∃ (p2 : person), Nice p1 → Likes p1 p2) → 
-- ((∃ p1 : person), (∀ p2 : person), Nice p2 → Likes p2 p1)


example: ∃ n : ℕ, n = 1 :=
begin
  exact exists.intro 1 (eq.refl 1),
end

example: ¬ (∀ p : Person, Likes p p) ↔ ∃ p : Person, ¬ Likes p p :=
begin
  apply iff.intro _ _,
    assume h,
    have f := classical.em (∃ p : Person, ¬ Likes p p),
    cases f,
    -- case #1
    assumption,
    -- case #2
    -- propose new fact
    have contra : ∀ (p : Person), Likes p p := _,
    contradiction,
    assume p,
    
    have g := classical.em (Likes p p),
    cases g, 
    assumption,
    have a : ∃ (p : Person), ¬Likes p p := exists.intro p g,
    contradiction,
    -- backward
    assume h, 
    cases h with p t,
    

end