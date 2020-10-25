# BlueBERT-Base, Uncased, PubMed
wget https://ftp.ncbi.nlm.nih.gov/pub/lu/Suppl/NCBI-BERT/NCBI_BERT_pubmed_uncased_L-12_H-768_A-12.zip -d bluebert_base_pubmed;
unzip bluebert_base_pubmed.zip -d bluebert_base_pubmed/;
rm bluebert_base_pubmed.zip;

# get convert.py
wget https://raw.githubusercontent.com/huggingface/transformers/master/src/transformers/convert_bert_original_tf_checkpoint_to_pytorch.py;

# exec converting for bluebert_base_pubmed
python convert_bert_original_tf_checkpoint_to_pytorch.py \
        --tf_checkpoint_path=bluebert_base_pubmed/bert_model.ckpt \
        --bert_config_file=bluebert_base_pubmed/bert_config.json \
        --pytorch_dump_path=bluebert_base_pubmed/pytorch_model.bin;

# organize the spares
mv bluebert_base_pubmed/bert_config.json bluebert_base_pubmed/config.json;
rm bluebert_base_pubmed/bert_model.ckpt*;
mv bluebert_base_pubmed pytorch_bluebert_base_pubmed;

rm convert_bert_original_tf_checkpoint_to_pytorch.py;
rm -rf wandb;