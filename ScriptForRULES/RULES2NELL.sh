bash gen_data.sh ./data/NELL/ 0.8
bash run_transe.sh --workspace ./data/NELL/ --margin 3 --lr 0.1 --ncomp 50
java -XX:-UseGCOverheadLimit -Xmx12G -jar mining/build.jar -w ./data/NELL/ -em transe
bash infer.sh ./data/NELL/ ./data/NELL/rules.txt.sorted 100 ./data/NELL/new_facts.txt
