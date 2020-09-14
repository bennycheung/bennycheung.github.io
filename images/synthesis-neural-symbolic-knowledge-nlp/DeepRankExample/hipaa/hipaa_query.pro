query_dep(0, 'done', 'VBN', 'nsubjpass', 'What', 'WP').
query_dep(0, 'done', 'VBN', 'aux', 'must', 'MD').
query_dep(0, 'done', 'VBN', 'auxpass', 'be', 'VB').
query_dep(0, 'done', 'VBN', 'advcl', 'disclosing', 'VBG').
query_dep(0, 'disclosing', 'VBG', 'mark', 'before', 'IN').
query_dep(0, 'disclosing', 'VBG', 'dobj', 'information', 'NN').
query_dep(0, 'information', 'NN', 'amod', 'protected', 'JJ').
query_dep(0, 'information', 'NN', 'compound', 'health', 'NN').
query_dep(0, 'done', 'VBN', 'punct', '?', '.').
query_edge(0, 'what', 'WP', 'nsubjpass', 'do', 'VBN').
query_edge(0, 'what', 'WP', 'recommends', 0, 'SENT').
query_edge(0, 'must', 'MD', 'aux', 'do', 'VBN').
query_edge(0, 'must', 'MD', 'recommends', 0, 'SENT').
query_edge(0, 'be', 'VB', 'auxpass', 'do', 'VBN').
query_edge(0, 'be', 'VB', 'recommends', 0, 'SENT').
query_edge(0, 'disclose', 'VBG', 'advcl', 'do', 'VBN').
query_edge(0, 'disclose', 'VBG', 'recommends', 0, 'SENT').
query_edge(0, 'before', 'IN', 'mark', 'disclose', 'VBG').
query_edge(0, 'before', 'IN', 'recommends', 0, 'SENT').
query_edge(0, 'disclose', 'VBG', 'dobj', 'information', 'NN').
query_edge(0, 0, 'SENT', 'about', 'information', 'NN').
query_edge(0, 'information', 'NN', 'first_in', 0, 'SENT').
query_edge(0, 'protected', 'JJ', 'amod', 'information', 'NN').
query_edge(0, 'protected', 'JJ', 'recommends', 0, 'SENT').
query_edge(0, 'information', 'NN', 'compound', 'health', 'NN').
query_edge(0, 'health', 'NN', 'first_in', 0, 'SENT').
query_edge(0, 'information', 'NN', 'fused', 'health information', 'NN').
query_edge(0, 'health', 'NN', 'fused', 'health information', 'NN').
query_edge(0, 0, 'SENT', 'predicate', 'do', 'VBN').
 
query_rank(0, 0.2117686368187647).
query_rank('do', 0.1901547061901503).
query_rank('information', 0.1583744819318917).
query_rank('health information', 0.11722255087351698).
query_rank('health', 0.08226078721179067).
query_rank('disclose', 0.05327823293658872).
query_rank('protected', 0.037388120807459416).
query_rank('be', 0.037388120807459416).
query_rank('must', 0.037388120807459416).
query_rank('before', 0.037388120807459416).
query_rank('what', 0.037388120807459416).

 
query_w2l('be', 'be', 'VB').
query_w2l('disclosing', 'disclose', 'VBG').
query_w2l('done', 'do', 'VBN').
query_w2l('What', 'what', 'WP').
query_w2l('health', 'health', 'NN').
query_w2l('?', '?', '.').
query_w2l('protected', 'protected', 'JJ').
query_w2l('before', 'before', 'IN').
query_w2l('must', 'must', 'MD').
query_w2l('information', 'information', 'NN').
 
query_sent(0, ['What', 'must', 'be', 'done', 'before', 'disclosing', 'protected', 'health', 'information', '?']).
 
 

 

query_pers_sents(2, 0.009928084529448515).
query_pers_sents(47, 0.001039990750767479).
query_pers_sents(3, 0.0009725946940543625).
query_pers_sents(39, 0.0005346331654823168).
query_pers_sents(45, 0.00021343445680081766).

query_pers_words('information', 0.13353154210148246).
query_pers_words('health', 0.06354039871072636).
query_pers_words('authorization', 0.05250851512108569).
query_pers_words('entity', 0.02377777273893545).
query_pers_words('use', 0.017322321798758936).
query_pers_words('disclosure', 0.014244160447109666).
query_pers_words('creation', 0.01376021779103124).
query_pers_words('paragraph', 0.013716410186345568).
query_pers_words('sale', 0.013242210819942125).
query_pers_words('marketing', 0.012552024490872418).
query_pers_words('research', 0.011433867069917242).
query_pers_words('material', 0.009457975451925001).
query_pers_words('potential', 0.009350279086852585).
query_pers_words('health provider', 0.009194346396214133).
query_pers_words('provision', 0.008256038480513045).
query_pers_words('note', 0.007627940972009604).
query_pers_words('section', 0.007545116940455805).
query_pers_words('treatment', 0.006869105707276295).
query_pers_words('individual', 0.006606641117929452).
query_pers_words('party', 0.006529093489734583).
query_pers_words('statement', 0.005495680184649143).
query_pers_words('study', 0.005219103458164998).
query_pers_words('condition', 0.004876951002325177).
query_pers_words('obtain', 0.004318179245504203).

query_param('quest_memory', 1).
query_param('max_answers', 3).
query_param('repeat_answers', 'yes').
query_param('personalize', 30).
query_param('by_rank', 'no').

