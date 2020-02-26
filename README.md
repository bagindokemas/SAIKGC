# SIC
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
KB2E-TransE. More about this tool, please click [here](https://github.com/thunlp/KB2E).
TransC. More about this tool, please click [here](https://github.com/davidlvxin/TransC).

Rule learning system: 
RUMIS. More about this tool, please click [here](https://github.com/htran010589/nonmonotonic-rule-mining).
RuLES. More about this tool, please click [here](https://github.com/hovinhthinh/RuLES).
materialization service of the Hermit reasoner. More about this tool, please click [here](http://www.hermit-reasoner.com/)

# Approximate Consistency Checking (ACC)
There are two components of approximate consistency checking module. First is [TBox Scanner](https://github.com/bagindokemas/meOnJIST2018/blob/master/TBoxScanner.java) and the second is [ABox scanner](https://github.com/bagindokemas/meOnJIST2018/blob/master/ABoxScanner.zip). 

# Bash and python scripts for integrating the triple producers, and ACC in MapReduce manner
1. Scripts for operating the KG Embedding approach (located in the folder ScriptForEmbedding).
2. Scripts for operating the Rule Learning approach (located in the folder ScriptForRL).
3. Scripts for executing the Reduce Stage for a triple producer (located in the folder ReduceStage).

# Usage
1. First of all, download all the dataset, uncompress it and put it under Dataset directory. 
2. If you want to run the Classic SIC, please download the modified KB2E [here](https://github.com/bagindokemas/SAIKGC/blob/master/KB2ETransE.zip)and materialization service of Hermit [here](https://github.com/bagindokemas/SAIKGC/blob/master/MaterializationServiceHErmit.zip). Also, download RUMIS tool from [here](https://github.com/htran010589/nonmonotonic-rule-mining). Put all these triple producers under TripleProducer directory. But, if you want to run the MapReduce SIC, please download TransC and RuLES in the link that I have aforementioned above.
3. Download the approximate consistency checking (ACC) module, uncompress it and put it under ACC directory.
4. Download the schemas / TBoxes, uncompress it and put it under ACC directory.
5. Download all the scripts inside the ReduceStage folder.
6. Download all the scripts inside the ScriptForRL folder.
7. Download all the scripts inside the ScriptForEmbedding folder.
8. Download all the scripts inside the Materialization folder.
9. Download all the scripts inside the mainBashScripts folder.
10. Assume that  you choose the NELL KG, then, run the TBox of the NELL KG using TBox scanner. Collect the outputs (TBoxPatterns), as it will be needed by the ABox scanner.
11. There are many alternative combinations that you can try from our paper. For example, if you want to run combination 1: R-ACC-E-ACC-M for the NELL KG, pick NELLMRFlow1.sh and then change the value of variable i (in line 3) to 0 and then change the value of variable i in line 250 with the value that you choose.
