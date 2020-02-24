#pecah x1 jadi 90% train.txt, 5% valid.txt, 5% test.txt
#kalau Single combination, yang displit adalah triple2idx.txt. Kalau MapReduce, yang displit adalah x1
split -da 2 -n r/20 x1
cat x00 x01 x02 x03 x04 x05 x06 x07 x08 x09 x10 x11 x12 x13 x14 x15 x16 x17 > triple2idxxx.txt

mv triple2idxxx.txt ../data/NELL/Train/
mv x18 triple2id_positivex.txt
mv triple2id_positivex.txt ../data/NELL/Test/

mv x19 triple2id_positivex.txt
mv triple2id_positivex.txt ../data/NELL/Valid/

python 8.add1LineForFiles.py ../data/NELL/Train/triple2idxxx.txt ../data/NELL/Train/triple2id.txt
python 8.add1LineForFiles.py ../data/NELL/Test/triple2id_positivex.txt ../data/NELL/Test/triple2id_positive.txt
python 8.add1LineForFiles.py ../data/NELL/Valid/triple2id_positivex.txt ../data/NELL/Valid/triple2id_positive.txt

#hapus file2 sementara
rm x00 x01 x02 x03 x04 x05 x06 x07 x08 x09 x10 x11 x12 x13 x14 x15 x16 x17


#eksekusi TransC
cd ../src/
#dataset NELL disamarkan dengan dataset YAGO39k
./MRNELL
./LPNELL > outputNELL.txt
