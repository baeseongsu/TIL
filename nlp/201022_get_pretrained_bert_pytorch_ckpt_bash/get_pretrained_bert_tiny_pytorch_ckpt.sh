# define name variable
export BERT_TINY="bert_tiny";

# load bert-tiny
wget https://storage.googleapis.com/bert_models/2020_02_20/uncased_L-2_H-128_A-2.zip -O $BERT_TINY.zip;
unzip $BERT_TINY.zip -d $BERT_TINY/;
rm $BERT_TINY.zip;

# change tf files to pytorch
wget https://raw.githubusercontent.com/huggingface/transformers/master/src/transformers/convert_bert_original_tf_checkpoint_to_pytorch.py;

# exec converting for bert-tiny
python convert_bert_original_tf_checkpoint_to_pytorch.py \
	--tf_checkpoint_path=$BERT_TINY/bert_model.ckpt \
	--bert_config_file=$BERT_TINY/bert_config.json \
	--pytorch_dump_path=$BERT_TINY/pytorch_model.bin ;

# organize bert-tiny directory
mv $BERT_TINY/bert_config.json $BERT_TINY/config.json;
rm $BERT_TINY/bert_model.ckpt*;
mv $BERT_TINY pytorch_$BERT_TINY;

# clean the current directory
rm convert_bert_original_tf_checkpoint_to_pytorch.py;
rm -rf wandb;