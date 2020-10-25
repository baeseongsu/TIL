# define name variable
export BERT_SMALL="bert_small";

# load bert-small
wget https://storage.googleapis.com/bert_models/2020_02_20/uncased_L-4_H-512_A-8.zip -O $BERT_SMALL.zip;
unzip $BERT_SMALL.zip -d $BERT_SMALL/;
rm $BERT_SMALL.zip;

# change tf files to pytorch
wget https://raw.githubusercontent.com/huggingface/transformers/master/src/transformers/convert_bert_original_tf_checkpoint_to_pytorch.py;

# exec converting for bert-small
python convert_bert_original_tf_checkpoint_to_pytorch.py \
	--tf_checkpoint_path=$BERT_SMALL/bert_model.ckpt \
        --bert_config_file=$BERT_SMALL/bert_config.json \
	--pytorch_dump_path=$BERT_SMALL/pytorch_model.bin ;

# organize bert-small directory
mv $BERT_SMALL/bert_config.json $BERT_SMALL/config.json;
rm $BERT_SMALL/bert_model.ckpt*;
mv $BERT_SMALL pytorch_$BERT_SMALL;

# clean the current directory
rm convert_bert_original_tf_checkpoint_to_pytorch.py;
rm -rf wandb;