**Nume: SAMSON Alexandru-Valentin**
**Grupă: 312CC**


## Tema 1 – Metode Numerice Matriceale


### Descriere:

## 1 - Markov is coming ...

* Funcția „parse_labyrinth” citește un fișier de la calea dată, extrage
dimensiunile și valorile unei matrice labirint, creează o matrice cu dimensiunile
date și o populează cu valorile din fișier. Apoi returnează matricea labirint rezultată.

* Funcția „get_adjacency_matrix” creează o matrice rară goală cu o dimensiune care
corespunde numărului de celule din labirint plus două stări suplimentare, inițializează
matricea de adiacență verificând pereții fiecărei celule și marchează adiacența dintre
celulele vecine fără perete. De asemenea, marchează adiacența dintre celule și cele două
stări suplimentare reprezentând stările WIN și LOSE. În cele din urmă, returnează matricea
de adiacență.

* Funcția „get_link_matrix” creează o matrice rară goală cu o dimensiune corespunzătoare
numărului de celule din labirint plus două stări suplimentare, inițializează matricea de
legături verificând pereții fiecărei celule și marcând legăturile dintre celule învecinate
fără pereți. De asemenea, calculează numărul de vecini și atribuie probabilități de mutare
celulelor sau stărilor învecinate pe baza prezenței sau absenței pereților. În cele din urmă,
returnează matricea de legături.

* Funcția „get_Jacobi_parameters” extrage o submatrice G și un vector coloană c și le
returnează ca ieșire. G se obține luând primele m-2 rânduri și primele n-2 coloane din
Link. c se obține luând primele m-2 rânduri ale coloanei n-1 din Link. Funcția
inițializează G și c ca matrici rare goale și apoi le atribuie submatricele extrase.

* Funcția "perform_iterative" inițializează soluția aproximativă x cu valorile inițiale
și efectuează metoda Jacobi în care calculează o nouă aproximare a soluției prin înmulțirea
lui G cu aproximarea anterioară și adăugarea lui c. Continuă să itereze până când eroarea
relativă la aproximarea anterioară este sub nivelul de toleranță sau până când este atins
numărul maxim de iterații. Funcția returnează aproximarea finală x, eroarea finală și
numărul de pași parcurși.

* Funcția "heuristic_greedy" inițializează un vector visited pentru a ține evidența
nodurilor vizitate și o matrice path cu poziția de pornire. Funcția intră apoi într-o
buclă while, care rulează până când calea este goală sau se ajunge la nodul WIN. La
fiecare iterație, funcția ia ultimul nod din cale, își găsește vecinii nevizitați și
selectează vecinul nevizitat cu cea mai mare probabilitate de a ajunge la nodul WIN
Dacă toți vecinii au fost vizitați sau nu există vecini nevizitați, ultimul nod este
eliminat din path. Dacă este găsit un vecin cu cea mai mare probabilitate, acesta este
marcat ca vizitat și adăugat la path. În cele din urmă, calea este returnată ca un
vector de noduri. Dacă nu există o cale către nodul WIN, este returnată o cale goală.

* Funcția "decode_path" iterează peste vectorul path, calculând indicii de rând și de
coloană pentru fiecare element. Perechile rezultate de indici sunt apoi atașate unui
nou vector decoded_path. În cele din urmă, funcția elimină ultimul element din
decoded_path, care corespunde stării WIN, și returnează vectorul rezultat.

## 2 - Linear Regression

* Funcția "parse_data_set_file" citește un fișier de set de date situat la file_path.
Deschide fișierul, citește prima linie pentru a obține dimensiunile m și n, apoi citește
liniile rămase pentru a obține setul de date InitialMatrix și vectorul Y.

* Funcția "prepare_for_regression" preia o matrice inițială și o convertește într-o
matrice de caracteristici prin transformarea datelor categorice în date numerice și
lăsând datele numerice așa cum sunt. Matricea caracteristică rezultată are o coloană
suplimentară în comparație cu matricea inițială. Funcția iterează prin matricea
inițială și aplică diferite valori numerice pentru fiecare categorie: 1 pentru „da”,
0 pentru „nu”, 1 și 0 pentru „semi-furnished”, 0 și 1 pentru „unfurnished”, 0 și 0
pentru „furnished” și convertește valorile numerice la numere dacă nu sunt deja numere.
În cele din urmă, funcția returnează matricea caracteristică rezultată.

* Funcția "linear_regression_cost_function" calculează costul prin iterarea fiecărui
sample din matricea de caracteristici și calculând diferența dintre rezultatul estimat
și rezultatul real, punând-o la pătrat și acumulând suma. În cele din urmă, returnează
media sumei împărțită la de 2 ori numărul de sample-uri.

* Funcția "parse_csv_file" analizează un fișier CSV situat la file_path, extragând
conținutul fișierului în două variabile: Y și InitialMatrix. Citește fișierul folosind
fopen și textscan, cu delimitatorul setat la virgulă. Prima linie a fișierului este
tratată ca o linie de antet și este ignorată. Datele sunt apoi convertite într-o
matrice de celule și returnate ca „InitialMatrix”. Prima coloană a datelor este
extrasă ca vector Y și, de asemenea, returnată.

* Funcția "gradient_descent" inițializează vectorul parametru Theta și funcția de
cost J, calculează gradientul lui J pentru fiecare parametru și actualizează Theta
în mod iterativ făcând pași de dimensiune alfa în direcția opusă gradientului pentru
un număr specificat de iterații.

* Funcția "normal_equation" inițializează matricea Theta cu zerouri, calculează
transpusa matricei de caracteristici înmulțită cu vectorul țintă și efectuează
metoda gradientului conjugat pentru a găsi valorile optime ale Theta. În cele din
urmă, funcția adaugă un rând de zerouri în partea de sus a matricei Theta și îl returnează.

* Funcția "lasso_regression_cost_function" calculează eroarea dintre valorile prezise
și cele reale pentru un anumit set de caracteristici de intrare, valori de ieșire și
parametri ai modelului (Theta). Se adaugă erorii un termen de regularizare L1, care
penalizează valoarea absolută a parametrilor modelului și ajustează un parametru de
regularizare (lambda). Funcția calculează mai întâi eroarea pătrată obișnuită, apoi
calculează norma parametrilor Theta și adaugă la eroare termenul de regularizare.

* Funcția "ridge_regression_cost_function" inițializează dimensiunile și setează
eroarea și suma pătrată la 0. Apoi, aplică regularizarea L2 intrărilor și calculează
eroarea și suma pătrată a termenului de regularizare. În cele din urmă, returnează
eroarea prin împărțirea sumei erorilor și a termenului de regularizare la dublul
numărului de sample-uri.

## 3 - MNIST 101

* Funcția "load_dataset" încarcă un set de date din fișierul specificat de path
folosind funcția load(). Matricea de intrare X și vectorul de ieșire y sunt apoi
extrase din structura de date încărcată și returnate de funcție.

* Funcția "split_dataset" preia o matrice de caracteristici X și un vector țintă
y și le împarte în seturi de antrenament și testare pe baza unui procent specificat.
Funcția amestecă aleatoriu datele, selectează primul „procent” procent din exemple
pentru antrenament și exemplele rămase pentru testare.

* Funcția "initialize_weights" calculează valoarea lui epsilon și apoi generează
o matrice de valori aleatoare în intervalul (-ε, ε) pentru a fi utilizată ca ponderi.
Matricea are L_next rânduri și L_prev + 1 coloane.

* Funcția "cost_function" mai întâi remodelează parametrii în matricele de weights
Theta1 și Theta2, efectuează forward propagation pentru a calcula valorile de ieșire,
calculează funcția de cost cu regularizare și apoi efectuează backpropagation pentru
a calcula gradienții. În cele din urmă, desfășoară gradienții într-un singur vector coloană.

* Funcția "predict_classes" prezice clasele pentru un set dat de date de intrare,
efectuând forward propagation folosind weights-urile transmise ca intrare. Vectorul
de weights este remodelat în matrice pentru fiecare strat, iar funcția de activare
sigmoid este aplicată intrărilor pentru a produce rezultatul fiecărui strat. Clasa
prezisă este indicele valorii maxime din vectorul de ieșire pentru fiecare exemplu de intrare.

### Comentarii asupra temei:

* Tema această m-a învățat cum să lucrez în Octave, precum și lucruri interesante
despre învățarea supervizată și cum se implementează în anumite situații.

* Mesajul următor este de considerat numai în cazul în care punctajul pe vmchecker
nu corespunde punctajului meu pe local, deoarece este prea mare coada pe vmchecker
pentru a vedea dacă punctajele sunt identice până expiră timpul de predare:

Doresc corectarea manuală a testelor pentru tema 1.

### Surse:

* https://stackoverflow.com/questions/38824942/
octave-matlab-read-text-file-line-by-line-and-save-only-numbers-into-matrix

* https://stackoverflow.com/questions/46841985/
matlab-octave-how-to-parse-csv-file-with-numbers-and-strings-that-contain-co

* https://www.mathworks.com/matlabcentral/answers/
324891-how-to-randomly-shuffle-the-row-elements-of-a-predefined-matrix

### Punctajul obținut la teste local:

* FINAL SCORE: 120p / 120p