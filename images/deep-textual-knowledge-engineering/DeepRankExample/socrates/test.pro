dep(0, 'write', 'VB', 'nsubj', 'Socrates', 'NNP').
dep(0, 'write', 'VB', 'aux', 'did', 'VBD').
dep(0, 'write', 'VB', 'neg', 'not', 'RB').
dep(0, 'write', 'VB', 'dobj', 'books', 'NNS').
dep(0, 'books', 'NNS', 'det', 'any', 'DT').
dep(0, 'write', 'VB', 'punct', '.', '.').
dep(1, 'student', 'NN', 'nsubj', 'Plato', 'NNP').
dep(1, 'student', 'NN', 'cop', 'is', 'VBZ').
dep(1, 'student', 'NN', 'det', 'a', 'DT').
dep(1, 'student', 'NN', 'nmod', 'Socrates', 'NNP').
dep(1, 'Socrates', 'NNP', 'case', 'of', 'IN').
dep(1, 'student', 'NN', 'punct', '.', '.').
dep(2, 'wrote', 'VBD', 'nsubj', 'Plato', 'NNP').
dep(2, 'wrote', 'VBD', 'dobj', 'books', 'NNS').
dep(2, 'wrote', 'VBD', 'cc', 'and', 'CC').
dep(2, 'wrote', 'VBD', 'conj', 'put', 'VB').
dep(2, 'put', 'VB', 'dobj', 'words', 'NNS').
dep(2, 'put', 'VB', 'nmod', 'mouth', 'NN').
dep(2, 'mouth', 'NN', 'case', 'into', 'IN').
dep(2, 'mouth', 'NN', 'compound', 'Socrates', 'NNP').
dep(2, 'wrote', 'VBD', 'punct', '.', '.').
edge(0, 'write', 'VB', 'nsubj', 'Socrates', 'NNP').
edge(0, 0, 'SENT', 'about', 'Socrates', 'NNP').
edge(0, 'Socrates', 'NNP', 'first_in', 0, 'SENT').
edge(0, 'do', 'VBD', 'aux', 'write', 'VB').
edge(0, 'do', 'VBD', 'recommends', 0, 'SENT').
edge(0, 'not', 'RB', 'neg', 'write', 'VB').
edge(0, 'not', 'RB', 'recommends', 0, 'SENT').
edge(0, 'write', 'VB', 'dobj', 'book', 'NNS').
edge(0, 0, 'SENT', 'about', 'book', 'NNS').
edge(0, 'book', 'NNS', 'first_in', 0, 'SENT').
edge(0, 'any', 'DT', 'det', 'book', 'NNS').
edge(0, 'any', 'DT', 'recommends', 0, 'SENT').
edge(0, 0, 'SENT', 'predicate', 'write', 'VB').
edge(1, 'student', 'NN', 'nsubj', 'Plato', 'NNP').
edge(1, 'Plato', 'NNP', 'first_in', 1, 'SENT').
edge(1, 'be', 'VBZ', 'cop', 'student', 'NN').
edge(1, 'be', 'VBZ', 'recommends', 1, 'SENT').
edge(1, 'a', 'DT', 'det', 'student', 'NN').
edge(1, 'a', 'DT', 'recommends', 1, 'SENT').
edge(1, 'student', 'NN', 'nmod', 'Socrates', 'NNP').
edge(1, 'of', 'IN', 'case', 'Socrates', 'NNP').
edge(1, 'of', 'IN', 'recommends', 1, 'SENT').
edge(1, 1, 'SENT', 'predicate', 'student', 'NN').
edge(2, 'write', 'VBD', 'nsubj', 'Plato', 'NNP').
edge(2, 2, 'SENT', 'about', 'Plato', 'NNP').
edge(2, 'write', 'VBD', 'dobj', 'book', 'NNS').
edge(2, 2, 'SENT', 'about', 'book', 'NNS').
edge(2, 'and', 'CC', 'cc', 'write', 'VBD').
edge(2, 'and', 'CC', 'recommends', 2, 'SENT').
edge(2, 'put', 'VB', 'conj', 'write', 'VBD').
edge(2, 'put', 'VB', 'recommends', 2, 'SENT').
edge(2, 'put', 'VB', 'dobj', 'word', 'NNS').
edge(2, 2, 'SENT', 'about', 'word', 'NNS').
edge(2, 'word', 'NNS', 'first_in', 2, 'SENT').
edge(2, 'put', 'VB', 'nmod', 'mouth', 'NN').
edge(2, 'mouth', 'NN', 'first_in', 2, 'SENT').
edge(2, 'into', 'IN', 'case', 'mouth', 'NN').
edge(2, 'into', 'IN', 'recommends', 2, 'SENT').
edge(2, 'mouth', 'NN', 'compound', 'Socrates', 'NNP').
edge(2, 'mouth', 'NN', 'fused', 'Socrates mouth', 'NN').
edge(2, 'Socrates', 'NNP', 'fused', 'Socrates mouth', 'NNP').
edge(2, 2, 'SENT', 'predicate', 'write', 'VBD').
 
rank('Socrates', 0.13106262484911943).
rank('student', 0.10238177148979816).
rank(0, 0.09341050158946196).
rank('book', 0.09237385442971471).
rank('Plato', 0.0866046865751659).
rank('write', 0.08069097513475772).
rank('Socrates mouth', 0.07110601307663854).
rank(1, 0.05761621064983509).
rank('word', 0.02246448628544874).
rank(2, 0.02176587685439639).
rank('mouth', 0.01722968961126349).
rank('do', 0.010521923321179575).
rank('not', 0.010521923321179575).
rank('and', 0.010521923321179575).
rank('put', 0.010521923321179575).
rank('be', 0.010521923321179575).
rank('any', 0.010521923321179575).
rank('a', 0.010521923321179575).
rank('of', 0.010521923321179575).
rank('into', 0.010521923321179575).

 
w2l('Socrates', 'Socrates', 'NNP').
w2l('mouth', 'mouth', 'NN').
w2l('student', 'student', 'NN').
w2l('Plato', 'Plato', 'NNP').
w2l('.', '.', '.').
w2l('a', 'a', 'DT').
w2l('books', 'book', 'NNS').
w2l('and', 'and', 'CC').
w2l('words', 'word', 'NNS').
w2l('write', 'write', 'VB').
w2l('did', 'do', 'VBD').
w2l('of', 'of', 'IN').
w2l('not', 'not', 'RB').
w2l('any', 'any', 'DT').
w2l('is', 'be', 'VBZ').
w2l('put', 'put', 'VB').
w2l('into', 'into', 'IN').
w2l('wrote', 'write', 'VBD').
 
sent(0, ['Socrates', 'did', 'not', 'write', 'any', 'books', '.']).
sent(1, ['Plato', 'is', 'a', 'student', 'of', 'Socrates', '.']).
sent(2, ['Plato', 'wrote', 'books', 'and', 'put', 'words', 'into', 'Socrates', 'mouth', '.']).
 
ner(0, [(0, ('Socrates', 'PERSON'))]).
ner(1, [(0, ('Plato', 'PERSON')), (1, ('student', 'TITLE')), (2, ('Socrates', 'PERSON'))]).
ner(2, [(0, ('Plato', 'PERSON')), (1, ('Socrates', 'PERSON'))]).
 
svo('Socrates', 'write', 'book', 0).
svo('Plato', 'write', 'book', 2).

 
summary(0, ['Socrates', 'did', 'not', 'write', 'any', 'books', '.']).
summary(1, ['Plato', 'is', 'a', 'student', 'of', 'Socrates', '.']).
summary(2, ['Plato', 'wrote', 'books', 'and', 'put', 'words', 'into', 'Socrates', 'mouth', '.']).
 
keyword('Socrates').
keyword('student').
keyword('book').
keyword('Plato').
keyword('word').
keyword('mouth').
 
