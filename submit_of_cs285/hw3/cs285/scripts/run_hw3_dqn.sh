# root to HW3
cd hw3
# Experiment 1
python -W ignore cs285/scripts/run_hw3_dqn.py --env_name MsPacman-v0 --exp_name q1
python cs285/scripts/read_results.py q1 --figname image/exp1_1.png

# Experiment 2
python -W ignore cs285/scripts/run_hw3_dqn.py --env_name LunarLander-v3 --exp_name q2_dqn_1 --seed 1
python -W ignore cs285/scripts/run_hw3_dqn.py --env_name LunarLander-v3 --exp_name q2_dqn_2 --seed 2
python -W ignore cs285/scripts/run_hw3_dqn.py --env_name LunarLander-v3 --exp_name q2_dqn_3 --seed 3
python cs285/scripts/read_results.py q2_dqn_1 q2_dqn_2 q2_dqn_3 -y Train_AverageReturn --plot_type avg_performance --figname image/exp2_1.png
python -W ignore cs285/scripts/run_hw3_dqn.py --env_name LunarLander-v3 --exp_name q2_doubledqn_1 --double_q --seed 1
python -W ignore cs285/scripts/run_hw3_dqn.py --env_name LunarLander-v3 --exp_name q2_doubledqn_2 --double_q --seed 2
python -W ignore cs285/scripts/run_hw3_dqn.py --env_name LunarLander-v3 --exp_name q2_doubledqn_3 --double_q --seed 3
python cs285/scripts/read_results.py q2_doubledqn_1 q2_doubledqn_2 q2_doubledqn_3 -y Train_AverageReturn --plot_type avg_performance --figname image/exp2_2.png
