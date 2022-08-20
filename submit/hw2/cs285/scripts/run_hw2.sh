cd "~/repos/RL_code/submit/hw2/"
# Experiment 1
python -W ignore cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 1000 -s 8 -l 2 --discount 0.9 -dsa --exp_name q1_sb_no_rtg_dsa
python -W ignore cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 1000 -s 8 -l 2 --discount 0.9 -rtg -dsa --exp_name q1_sb_rtg_dsa
python -W ignore cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 1000 -s 8 -l 2 --discount 0.9 -rtg --exp_name q1_sb_rtg_na

python cs285/scripts/read_results.py q1_sb_no_rtg_dsa q1_sb_rtg_dsa q1_sb_rtg_na --figname image/exp1-1.png

python -W ignore cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 5000 -s 8 -l 2 --discount 0.9 -dsa --exp_name q1_lb_no_rtg_dsa
python -W ignore cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 5000 -s 8 -l 2 --discount 0.9 -rtg -dsa --exp_name q1_lb_rtg_dsa
python -W ignore cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 5000 -s 8 -l 2 --discount 0.9 -rtg --exp_name q1_lb_rtg_na

python cs285/scripts/read_results.py q1_lb_no_rtg_dsa q1_lb_rtg_dsa q1_lb_rtg_na --figname image/exp1-2.png

# Experiment 2
for b in 1000, 1500, 2000, 2500, 3000; do 
    python -W ignore cs285/scripts/run_hw2.py --env_name InvertedPendulum-v2 --ep_len 1000 --discount 0.9 -n 100 -l 2 -s 64 -b $b -lr 5e-3 -rtg --exp_name q2_b_$b
done
python cs285/scripts/read_results.py q2_b_1000 q2_b_1500 q2_b_2000 q2_b_2500 q2_b_3000 --figname image/exp2-1.png

for lr in 0.005 0.01 0.02 0.03 0.04 0.05 do
    python -W ignore cs285/scripts/run_hw2.py --env_name InvertedPendulum-v2 --ep_len 1000 --discount 0.9 -n 100 -l 2 -s 64 -b 1000 -lr $lr -rtg --exp_name q2_lr_$lr
done
python cs285/scripts/read_results.py q2_lr_0.005 q2_lr_0.01 q2_lr_0.02 q_lr_0.03 q_lr_0.04 q_lr_0.05 --figname image/exp2-2.png


# Experiment 3
python -W ignore cs285/scripts/run_hw2.py --env_name LunarLanderContinuous-v2 --ep_len 1000 --discount 0.99 -n 100 -l 2 -s 64 -b 40000 -lr 0.005 --reward_to_go --nn_baseline --exp_name q3_b40000_r0.005
python cs285/scripts/read_results.py q3_b40000_r0.005 --figname image/exp3-1.png

# Experiment 4
for b in 10000 30000 50000; do 
    for r in 0.005 0.01 0.02; do
        python -W ignore cs285/scripts/run_hw2.py --env_name HalfCheetah-v2 --ep_len 150 --discount 0.95 -n 100 -l 2 -s 32 -b $b -lr $r -rtg --nn_baseline --exp_name q4_search_b$b"_lr"$r"_rtg_nnbaseline"
    done
done
python cs285/scripts/read_results.py q4_search_b10000_lr0.005_rtg_nnbaseline q4_search_b10000_lr0.01_rtg_nnbaseline q4_search_b10000_lr0.02_rtg_nnbaseline --figname image/exp_4b10000.png
python cs285/scripts/read_results.py q4_search_b30000_lr0.005_rtg_nnbaseline q4_search_b30000_lr0.01_rtg_nnbaseline q4_search_b30000_lr0.02_rtg_nnbaseline --figname image/exp_4b30000.png
python cs285/scripts/read_results.py q4_search_b50000_lr0.005_rtg_nnbaseline q4_search_b50000_lr0.01_rtg_nnbaseline q4_search_b50000_lr0.02_rtg_nnbaseline --figname image/exp_4b50000.png

python -W ignore cs285/scripts/run_hw2.py --env_name HalfCheetah-v2 --ep_len 150 --discount 0.95 -n 100 -l 2 -s 32 -b 50000 -lr 0.02 --exp_name q4_b5e4_r2e-2 
python -W ignore cs285/scripts/run_hw2.py --env_name HalfCheetah-v2 --ep_len 150 --discount 0.95 -n 100 -l 2 -s 32 -b 50000 -lr 0.02 -rtg --exp_name q4_b5e4_r2e-2_rtg
python -W ignore cs285/scripts/run_hw2.py --env_name HalfCheetah-v2 --ep_len 150 --discount 0.95 -n 100 -l 2 -s 32 -b 50000 -lr 0.02 --nn_baseline --exp_name q4_b5e4_r2e-2_nnbaseline
python -W ignore cs285/scripts/run_hw2.py --env_name HalfCheetah-v2 --ep_len 150 --discount 0.95 -n 100 -l 2 -s 32 -b 50000 -lr 0.02 -rtg --nn_baseline --exp_name q4_b5e4_r2e-2_rtg_nnbaseline

python cs285/scripts/read_results.py q4_b5e4_r2e-2 q4_b5e4_r2e-2_rtg q4_b5e4_r2e-2_nnbaseline q4_b5e4_r2e-2_rtg_nnbaseline --figname image/exp_4_2.png


# Experiment 5 
for gae_lambda in 0 0.95 0.99 1; do
    python -W ignore cs285/scripts/run_hw2.py --env_name Hopper-v2 --ep_len 1000 --discount 0.99 -n 300 -l 2 -s 32 -b 2000 -lr 0.001 --reward_to_go --nn_baseline --action_noise_std 0.5 --gae_lambda $gae_lambda --exp_name q5_b2000_r0.001_lambda$gae_lambda
done
python cs285/scripts/read_results.py q5_b2000_r0.001_lambda0 q5_b2000_r0.001_lambda0.95 q5_b2000_r0.001_lambda0.99 q5_b2000_r0.001_lambda1 --figname image/exp_5.png
