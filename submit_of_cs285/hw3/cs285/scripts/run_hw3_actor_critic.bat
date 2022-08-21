::Experiment 1
python -W ignore cs285/scripts/run_hw3_actor_critic.py --env_name CartPole-v0 -n 100 -b 1000 --exp_name q4_100_1 -ntu 100 -ngsptu 1
python -W ignore cs285/scripts/run_hw3_actor_critic.py --env_name CartPole-v0 -n 100 -b 1000 --exp_name q4_1_100 -ntu 1 -ngsptu 100
python -W ignore cs285/scripts/run_hw3_actor_critic.py --env_name CartPole-v0 -n 100 -b 1000 --exp_name q4_10_10 -ntu 10 -ngsptu 10
python cs285/scripts/read_results.py q4_100_1 q4_1_100 q4_10_10 --figname image/exp4_1.png

::Experiment 2
python -W ignore cs285/scripts/run_hw3_actor_critic.py --env_name InvertedPendulum-v2 --ep_len 1000 --discount 0.95 -n 100 -l 2 -s 64 -b 5000 -lr 0.01 --exp_name q5env1_50_2 -ntu 50 -ngsptu 2
python -W ignore cs285/scripts/run_hw3_actor_critic.py --env_name InvertedPendulum-v2 --ep_len 1000 --discount 0.95 -n 100 -l 2 -s 64 -b 5000 -lr 0.01 --exp_name q5env1_2_50 -ntu 2 -ngsptu 50
python -W ignore cs285/scripts/run_hw3_actor_critic.py --env_name InvertedPendulum-v2 --ep_len 1000 --discount 0.95 -n 100 -l 2 -s 64 -b 5000 -lr 0.01 --exp_name q5env1_10_10 -ntu 10 -ngsptu 10
python cs285/scripts/read_results.py q5env1_50_2 q5env1_2_50 q5env1_10_10 --figname image/exp5_1.png

python -W ignore cs285/scripts/run_hw3_actor_critic.py --env_name HalfCheetah-v2 --ep_len 150 --discount 0.90 --scalar_log_freq 1 -n 150 -l 2 -s 32 -b 30000 -eb 1500 -lr 0.02 --exp_name q5env2_50_2 -ntu 50 -ngsptu 2
python -W ignore cs285/scripts/run_hw3_actor_critic.py --env_name HalfCheetah-v2 --ep_len 150 --discount 0.90 --scalar_log_freq 1 -n 150 -l 2 -s 32 -b 30000 -eb 1500 -lr 0.02 --exp_name q5env2_2_50 -ntu 2 -ngsptu 50
python -W ignore cs285/scripts/run_hw3_actor_critic.py --env_name HalfCheetah-v2 --ep_len 150 --discount 0.90 --scalar_log_freq 1 -n 150 -l 2 -s 32 -b 30000 -eb 1500 -lr 0.02 --exp_name q5env2_10_10 -ntu 10 -ngsptu 10
python cs285/scripts/read_results.py q5env2_50_2 q5env2_2_50 q5env2_10_10 --figname image/exp5_2.png
