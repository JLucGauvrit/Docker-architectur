from deepseek_vl.models import VLChatProcessor, MultiModalityCausalLM
from transformers import AutoModelForCausalLM
import torch

model_path = "./workspace"

# Charge le tokenizer et le processeur
vl_chat_processor = VLChatProcessor.from_pretrained(model_path)
tokenizer = vl_chat_processor.tokenizer

# Charge le modèle en utilisant leur classe personnalisée
vl_gpt = AutoModelForCausalLM.from_pretrained(
    model_path,
    trust_remote_code=True,  # Nécessaire pour charger un modèle custom
    use_fast=True
)
vl_gpt = vl_gpt.to(torch.bfloat16).cuda().eval()
