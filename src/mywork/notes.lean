namespace implies

axioms (P Q : Prop) /- assuming P and Q are arbitrary propositions -/

def if_P_is_true_them_so_is_Q : Prop := P → Q /- if P is true then Q is true -/
-- need a proof (axiom) that P → Q and P itself

axiom p : P /- p is the name" P is the funcrion -/
-- assumme P is true
-- assue we have a proof of P (p)

axiom pq : P → Q /- pq is the "name" P → Q is the function -/
-- assume that we have a proof, pq, of P → Q

-- intro for implies: assume premise, show conclusion
-- elimination rule for implies: 

#check pq /- apply pq to prove -/
#check p /- apply p to prove-/
#check (pq p) /- look at Infoview pq p : Q-/

/- 
Suppose P and Q are propositions and you
know that P → Q and that P are both true. 
Show thta Q is true.

Proof: Apply the truth of P → Q to the 
truth of P to derive the truth of Q.
	
Proof: By the elimination rule for → with
pq applied to p.

Proof: By "modus ponens". QED
-/

end implies

namespace all
/- FORALL -/
axioms
	(T : Type)
	(P : T → Prop)
	(t : T)
	(a : ∀ (x : T), P x) /- forall x of type T it has property P-/
-- Does t have property P?  Yes, bc t is an object of type T and all c of type T has property P

example : P t :=  a t  /- P apply to t (propisition), a apply to t-/
#check a t 

/-
AND & → 
-/

axioms (P Q : Prop) /- Want a proof of P ∧ Q. -/


/-
***GIT Notes***
distributed version control system (VCS)
- everyone has a local repository (based on last sync)
* git --version --> will tell you what version you have
* git config --global user.na,e "Ellianna Bailey"
* git config --global user.email "exb3dg@virginia.edu"
* git config --list --> to see configuration
* git help config --> put any action wher config is for info
* git init
* rm --> remove
* ls --> ???
* touch .gitignore -->  simple text file that git will ignore
* git add .gitignore --> add .gitignore files to staging area
* git add -A --> add everything to staging area
* git reset --> remove files from staging area
* git commit --> ???
* git log --> log of commits
* git diff -> show changes to code
* git status --> status of files ie commited, untracked/tracked
* git pull upstream main --> pulls main repository
* git push origin main --> sends your changes


*homeowork*
How to write a conditional?
Introductional rule for ∧ and vs. implies → 
Have command in lean
intros in lean
rw, exact, apply



*Reasoning*
Inductive - reasonings to hypotheses
Abductive - formation of a hypothesis
Deductive - assumed truths  --> truths derived from axioms --> from axioms build theorems


Introduction rule - a rule that creates a proof
Elimination rule - use proofs 

Axiom for Equality
	1) Axiom of Reflexivity
	2) Axiom of Substitutability of Equals
	
Rules 
	- Symmetric
	- Transitivity


Functions are conjectures
Need proofs to get from conjectures to theorems


For all: Assume that you are given an arbitrary object of that type



Reflexive, transitive, and symmetric = 


and.intro   - and
eq.refl    any object of any type is equal to itself


- Proof: a false proposition has no proofs (else it'd be true!)

-/