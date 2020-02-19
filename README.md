# SAIKGC
This is a repository for the code and the dataset of our work: Schema Aware Iterative Knowledge Graph Completion (SAIKGC) that is under review in Journal of Web Semantic

# Dependencies
    Python 3.7.3
    OWLAPI 4.1.3
    JRE 1.8.0
    gcc-9.1.0
    jdk-12.0.1
    
# Dataset (ABoxes)
NELL-995: a knowledge graph from Carnegie Mellon university containing 142,065 triples. [\[Download\]](https://github.com/bagindokemas/meOnJIST2018/blob/master/NELLKG0.zip)

DBped-p: a subset of DBpedia KG that are related to political issues, containing 352,754 triples. [\[Download\]](https://github.com/bagindokemas/meOnJIST2018/blob/master/DBPedP.txt.zip)

# The schemas of the knowledge graph (TBoxes)
NELL-995. [\[Download\]](https://github.com/bagindokemas/SAIKGC/blob/master/NELL.ontology.ttl)

DBpedia. [\[Download\]](https://github.com/bagindokemas/SAIKGC/blob/master/dbpedia_2016-04.owl)

# Triples Producers
Knowledge graph embedding: 
KB2E-TransE. More about this tool, please click [here](https://github.com/thunlp/KB2E)
TransC. More about this tool, please click [here](https://github.com/davidlvxin/TransC)

Rule learning system: RUMIS. More about this tool, please click [here](https://github.com/htran010589/nonmonotonic-rule-mining)

materialization service of the Hermit reasoner. More More about this tool, please click [here](http://www.hermit-reasoner.com/)

# Approximate Consistency Checking (ACC)
There are two components of approximate consistency checking module. First is [TBox Scanner](https://github.com/bagindokemas/meOnJIST2018/blob/master/TBoxScanner.java) and the second is [ABox scanner](https://github.com/bagindokemas/meOnJIST2018/blob/master/ABoxScanner.zip). 

# Usage
1. First of all, download all the dataset, uncompress it and put it under Dataset directory. 
2. Download the modified KB2E and materialization service of Hermit [here](). Also, download RUMIS tool from [here](https://github.com/htran010589/nonmonotonic-rule-mining). Put all these triple producers under TripleProducer directory.
3. Download the approximate consistency checking (ACC) module, uncompress it and put it under ACC directory.
4. Download the schemas / TBoxes, uncompress it and put it under ACC directory.
5. Now, you already have all the ingredients to start the experiment! Choose a KG and its schema that you want to expand. Assume that  you choose NELL KG. There are many alternative flows that you can try from our paper. For example, if you want to run R-ACC-M-ACC-E-ACC flow for NELL KG, these are the following steps that you need to do.
6. Run the TBox of NELL using TBox scanner. Collect the outputs (TBoxPatterns), as it will be needed by the ABox scanner.
7. Run the initial ABox of NELL KG using RUMIS and then collect the new triples/expanded knowledge graph (EKG-R).
8. Put TBoxPatterns and EKG-R into one folder and then run the ABox scanner on it to produce new and correct triples (NCT-R).
9. Merge the initial ABox of NELL KG with NCT-R (we call the result of this merger INCT). Then, merge INCT with the TBox of NELL KG (you can do the last merger with using OWLOntologyMerger service from OWLAPI) and then run the merge file between INCT and the TBox of NELL KG using the materialization service of Hermit to produce new and correct triples (NCT-M).
10. Merge INCT with NCT-M (we call the result of this merger I-Embed). Then, run I-Embed with using the modified KB2E to produce new triples/expanded knowledge graph (EKG-E).
11. Put TBoxPatterns and EKG-E into one folder and then run the ABox scanner on it to produce new and correct triples (NCT-E).
12. Add NCT-R with NCT-M and NCT-E into total-NCT.
13. Compare total-NCT with the number of triples that processed by RUMIS in step 7 and multiply it with 100%. If the figure is \< 1% than stop the iteration. If it is \> 1%, go to step 7 and repeat the next iteration.
