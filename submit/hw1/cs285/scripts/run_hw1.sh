#!/bin/sh
cd ~/repos/RL_code/submit/hw1
# 初步运行bc-agent Ant-v2
python -W ignore cs285/scripts/run_hw1.py --expert_policy_file cs285/policies/experts/Ant.pkl --env_name Ant-v2 --exp_name bc_ant_initial --n_iter 1 --expert_data cs285/expert_data/expert_data_Ant-v2.pkl --video_log_freq -1 --ep_len 1000 --eval_batch_size 5000
# 初步运行bc-agent Hopper-v2
python -W ignore cs285/scripts/run_hw1.py --expert_policy_file cs285/policies/experts/Hopper.pkl --env_name Hopper-v2 --exp_name bc_hopper_initial --n_iter 1 --expert_data cs285/expert_data/expert_data_Hopper-v2.pkl --video_log_freq -1 --ep_len 1000 --eval_batch_size 5000 --n_layers 2 --size 6 -lr 0.005
# 调参learning rate
for lrs in  0.001 0.0025 0.005 0.0075 0.01; do
    python -W ignore cs285/scripts/run_hw1.py --expert_policy_file cs285/policies/experts/Ant.pkl --env_name Ant-v2 --exp_name lr_tune$lrs --n_iter 1 --expert_data cs285/expert_data/expert_data_Ant-v2.pkl --video_log_freq -1 --ep_len 1000 --eval_batch_size 3000 --n_layers 3 -lr $lrs
done

# 运行作业2 do-dagger
python -W ignore cs285/scripts/run_hw1.py --expert_policy_file cs285/policies/experts/Ant.pkl --env_name Ant-v2 --exp_name dagger_ant --expert_data cs285/expert_data/expert_data_Ant-v2.pkl --video_log_freq -1 --ep_len 1000 --eval_batch_size 5000 --do_dagger --n_iter 10 -lr 0.0025
python -W ignore cs285/scripts/run_hw1.py --expert_policy_file cs285/policies/experts/Hopper.pkl --env_name Hopper-v2 --exp_name dagger_hopper --expert_data cs285/expert_data/expert_data_Hopper-v2.pkl --video_log_freq -1 --ep_len 1000 --eval_batch_size 5000 --n_layers 2 --size 16 --do_dagger --n_iter 10
# 生成图表，根据tensorboard的log生成相关图表。 但是注意要根据Tensorboard实际生成的路径来确定log-path
python cs285/scripts/plot_tensorboard.py --log_path data/q2_dagger_ant_Ant-v2_07-07-2022_15-29-24/events.out.tfevents.1657178964.LAPTOP-DF1VF4M0.1938.0 \
                                                    data/q2_dagger_hopper_Hopper-v2_07-07-2022_15-30-22/events.out.tfevents.1657179022.LAPTOP-DF1VF4M0.1961.0 \
                                         --names Ant-v2 Hopper-v2