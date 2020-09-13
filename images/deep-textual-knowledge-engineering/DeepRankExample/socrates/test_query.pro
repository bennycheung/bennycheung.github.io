query_dep(0, 'get', 'VB', 'nsubj', 'Who', 'WP').
query_dep(0, 'get', 'VB', 'dobj', 'words', 'NNS').
query_dep(0, 'get', 'VB', 'nmod', 'mouth', 'NN').
query_dep(0, 'mouth', 'NN', 'case', 'into', 'IN').
query_dep(0, 'mouth', 'NN', 'nmod:poss', 'his', 'PRP$').
query_dep(0, 'get', 'VB', 'punct', '?', '.').
query_edge(0, 'who', 'WP', 'nsubj', 'get', 'VB').
query_edge(0, 'who', 'WP', 'recommends', 0, 'SENT').
query_edge(0, 'get', 'VB', 'dobj', 'word', 'NNS').
query_edge(0, 0, 'SENT', 'about', 'word', 'NNS').
query_edge(0, 'word', 'NNS', 'first_in', 0, 'SENT').
query_edge(0, 'get', 'VB', 'nmod', 'mouth', 'NN').
query_edge(0, 'mouth', 'NN', 'first_in', 0, 'SENT').
query_edge(0, 'into', 'IN', 'case', 'mouth', 'NN').
query_edge(0, 'into', 'IN', 'recommends', 0, 'SENT').
query_edge(0, 'he', 'PRP$', 'nmod:poss', 'mouth', 'NN').
query_edge(0, 'he', 'PRP$', 'recommends', 0, 'SENT').
query_edge(0, 0, 'SENT', 'predicate', 'get', 'VB').
 
query_rank(0, 0.3699953381433428).
query_rank('word', 0.25848447378547157).
query_rank('get', 0.1877840858272271).
query_rank('mouth', 0.11945038795824447).
query_rank('who', 0.021428571428571432).
query_rank('into', 0.021428571428571432).
query_rank('he', 0.021428571428571432).

 
query_w2l('mouth', 'mouth', 'NN').
query_w2l('Who', 'who', 'WP').
query_w2l('words', 'word', 'NNS').
query_w2l('his', 'he', 'PRP$').
query_w2l('into', 'into', 'IN').
query_w2l('get', 'get', 'VB').
query_w2l('?', '?', '.').
 
query_sent(0, ['Who', 'get', 'words', 'into', 'his', 'mouth', '?']).
 
 

 

query_pers_sents(2, 0.04665785221139873).
query_pers_sents(0, 0.03941656984805436).
query_pers_sents(1, 0.023229923389565903).

query_pers_words('word', 0.10259645681566519).
query_pers_words('Socrates', 0.05508246932990247).
query_pers_words('book', 0.05097116173328244).
query_pers_words('Plato', 0.046271022286889146).
query_pers_words('mouth', 0.03779615709270625).
query_pers_words('student', 0.03343327343409635).

query_param('quest_memory', 1).
query_param('max_answers', 3).
query_param('repeat_answers', 'yes').
query_param('personalize', 30).
query_param('by_rank', 'no').

