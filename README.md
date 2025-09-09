Markov is coming (Labyrinth & Markov Chains)

Abstract:
Implemented a full pipeline in Matlab/Octave to model a labyrinth as a Markov chain 
and compute escape probabilities:
- Parsed labyrinth encoding into adjacency and link matrices (stored as sparse for efficiency)
- Built transition probabilities using bitwise wall checks (bitand)
- Applied the Jacobi iterative method to solve the linear system of probabilities
- Designed a heuristic greedy search to find winning paths with maximum success probability
- Implemented path decoding back to matrix coordinates


A more detailed implementation can be found below:
parse_labyrinth
- Se citesc dimensiunile matricei labyrinth si cu ajutorul acestora se foloseste
 functia fscanf pentru a o citi.

get_adjacency_matrix
- Se initializeaza matricea Adj ca matrice rara cu ajutorul functiei sparse[1],
  deoarece aceasta ignora valorile nule, optimizand consumul de memorie.
- Se calculeaza indicele k aferent pozitiei (i, j) din  matricea Labyrinth in
  matricea Adj cu ajutorul formulei k = (i - 1) * n + j deoarece pe fiecare
  linie i se afla n elemente iar j ne da pozitia de pe acea linie.
- Verificarile existentelor peretilor se fac cu ajutorul operatiei pe biti
  AND pentru fiecare perete corespunzator in parte. Aceasta operatie a fost
  implementata cu ajutorul functiei bitand[2] ce realizeaza operatia binara
  AND intre 2 numere.
- Astfel, verificarile au fost urmatoarele:
  -pentru peretele de la Vest se face AND cu 1 (b0 = 2^0).
   Daca rezultatul este 0, peretele nu exista deci se leaga
   celula cu vecinul din stanga (k - 1) sau cu starea Lose
   daca ne aflam pe prima coloana.
  -pentru peretele de la Est se face AND cu 2 (b1= 2^1).
   Daca rezultatul este 0, peretele nu exista deci se leaga
   celula cu vecinul din dreapta (k + 1) sau cu starea Lose
   daca ne aflam pe ultima coloana.
  -pentru peretele de la Sud se face AND cu 4 (b2= 2^2).
   Daca rezultatul este 0, peretele nu exista deci se leaga
   celula cu vecinul de sub (k + n) sau cu starea Win
   daca ne aflam pe ultima linie.
  -pentru peretele de la Nord se face AND cu 8 (b3= 2^3).
   Daca rezultatul este 0, peretele nu exista deci se leaga
   celula cu vecinul de deasupra (k - n) sau cu starea Win
   daca ne aflam pe prima linie.
- Starile de Win si Lose sunt absordante deci celulele aferente (Win,Win) si
  (Lose, Lose) vor fi 1

get_link_matrix
- Se calculeaza matricea Adj cu ajutorul functiei anterioare.
- Se initializeaza matricea Link ca matrice rara cu ajutorul functiei sparse[1].
- Pentru fiecare stare i se calculeaza numarul de vecini si daca acesta e diferit
  de 0 se distribuie uniform probabilitatile (se impart elementele liniei la 
  numarul de vecini).

get_Jacobi_parameters
- Se extrage matricea G din matricea Link
- Se extrage vectorul coloana c din matricea Link

heuristic_greedy
- Se initializeaza drumul cu pozitia de start si un vector de vizitare
- Algoritmul ruleaza cat timp exista drum de explorat:
  - La fiecare pas verifica daca a ajuns la starea Win
  - Gaseste toti vecinii posibili ai pozitiei curente
  - Filtreaza vecinii nevizitati
  - Daca nu exista vecini nevizitati:
     * Se elimina ultima pozitie din drum (revenire la pozitia anterioara)
     * Continua explorarea din noua pozitie curenta
   - Daca exista vecini nevizitati:
     * Alege vecinul cu probabilitatea maxima folosind vectorul probabilities
     * Actualizeaza drumul si marcheaza pozitia ca vizitata

perform_iterative
- Se implementeaza metoda iterativa Jacobi

decode_path
- Se elimina starea Win daca este prezenta
- Se converteste fiecare indice liniar in pereche (linie, coloana) astfel:
  - coloana = restul impartirii la numarul de coloane, calcul implementat cu
    ajutorul functiei mod[3] ce calculeaza restul impartirii intre 2 numere 
  - linie = catul impartirii la numarul de coloane

sparse[1]: https://docs.octave.org/v4.2.2/Creating-Sparse-Matrices.html#XREFsparse
bitand[2]: https://octave.sourceforge.io/octave/function/bitand.html
mod[3]: https://octave.sourceforge.io/octave/function/mod.html
