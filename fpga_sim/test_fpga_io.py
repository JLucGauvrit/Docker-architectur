import time

pipe_path = "/dev/xdma0"

print(f"[LLM] Waiting for FPGA to be ready at {pipe_path}...")
with open(pipe_path, "w") as out_pipe, open(pipe_path, "r") as in_pipe:
    msg = "token_embedding_vector"
    print(f"[LLM] Sending to FPGA: {msg}")
    out_pipe.write(msg + "\n")
    out_pipe.flush()
    
    response = in_pipe.readline().strip()
    print(f"[LLM] Received from FPGA: {response}")
