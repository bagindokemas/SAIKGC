# SAIKGC
This is a repository for the code and the dataset of our work: Schema Aware Iterative Knowledge Graph Completion (SAIKGC)

# Dependencies
    python 2.7.12
    OWLAPI 4.1.3
    JRE 1.8.0
    
# Dataset (ABoxes)
IBM-KG: a knowledge graph automatically generated based on [IBM Storwize Knowledge Center articles](https://www.ibm.com/support/knowledgecenter/en/ST3FR7) , containing 28,982 triples. [\[Download\]](https://github.com/bagindokemas/meOnJIST2018/blob/master/IBMKG0.zip)

NELL-995: a knowledge graph from Carnegie Mellon university containing 142,065 triples. [\[Download\]](https://github.com/bagindokemas/meOnJIST2018/blob/master/NELLKG0.zip)

DBped-p: a subset of DBpedia KG that are related to political issues, containing 352,754 triples. [\[Download\]](https://github.com/bagindokemas/meOnJIST2018/blob/master/DBPedP.txt.zip)

# The schemas of the knowledge graph (TBoxes)
IBM-KG. [\[Download\]](master/NELLKG0.zip)
NELL-995. [\[Download\]](master/NELLKG0.zip)
DBpedia. [\[Download\]](master/NELLKG0.zip)

# Triples Producers
Knowledge graph embedding: KB2E-TransE. More about this tool, please click [here](https://github.com/thunlp/KB2E)

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
6. Run the TBox of NELL using TBox scanner. Collect the outputs, as it will be needed by the ABox scanner.
7. Run the ABox of NELL KG using RUMIS, collect the new triples/expanded.
8. Run the ABox 






