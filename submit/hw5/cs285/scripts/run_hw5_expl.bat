cd hw5
:: Part 1

python cs285/scripts/run_hw5_expl.py --env_name PointmassEasy-v0 --use_rnd --unsupervised_exploration --exp_name q1_env1_rnd
python cs285/scripts/run_hw5_expl.py --env_name PointmassEasy-v0 --unsupervised_exploration --exp_name q1_env1_random
python cs285/scripts/read_results.py q1_env1_rnd q1_env1_random --figname image/q1_1.png

python cs285/scripts/run_hw5_expl.py --env_name PointmassMedium-v0 --use_rnd --unsupervised_exploration --exp_name q1_env2_rnd
python cs285/scripts/run_hw5_expl.py --env_name PointmassMedium-v0 --unsupervised_exploration --exp_name q1_env2_random
python cs285/scripts/read_results.py q1_env2_rnd q1_env2_random --figname image/q1_2.png

:: Part 2
:: SubPart 1
python cs285/scripts/run_hw5_expl.py --env_name PointmassMedium-v0 --exp_name q2_dqn --use_rnd --unsupervised_exploration --offline_exploitation --cql_alpha 0
python cs285/scripts/run_hw5_expl.py --env_name PointmassMedium-v0 --exp_name q2_cql --use_rnd --unsupervised_exploration --offline_exploitation --cql_alpha 0.1
python cs285/scripts/run_hw5_expl.py --env_name PointmassMedium-v0 --exp_name q2_cql_scale10 --use_rnd --unsupervised_exploration --offline_exploitation --cql_alpha 0.1 --exploit_rew_shift 1 --exploit_rew_scale 10
python cs285/scripts/read_results.py q2_dqn q2_cql q2_cql_scale10 --figname image/q2_1.png

:: SubPart 2
python cs285/scripts/run_hw5_expl.py --env_name PointmassHard-v0 --use_rnd --num_exploration_steps 5000 --offline_exploitation --cql_alpha 0.1 --unsupervised_exploration --exploit_rew_shift 1 --exploit_rew_scale 25 --exp_name q2_cql_numsteps_5000
python cs285/scripts/run_hw5_expl.py --env_name PointmassHard-v0 --use_rnd --num_exploration_steps 15000 --offline_exploitation --cql_alpha 0.1 --unsupervised_exploration --exploit_rew_shift 1 --exploit_rew_scale 25 --exp_name q2_cql_numsteps_15000
python cs285/scripts/read_results.py q2_cql_numsteps_5000 q2_cql_numsteps_15000 --figname image/q2_2.png

python cs285/scripts/run_hw5_expl.py --env_name PointmassHard-v0 --use_rnd --num_exploration_steps 5000 --offline_exploitation --cql_alpha 0 --unsupervised_exploration --exploit_rew_shift 1 --exploit_rew_scale 25 --exp_name q2_dql_numsteps_5000
python cs285/scripts/run_hw5_expl.py --env_name PointmassHard-v0 --use_rnd --num_exploration_steps 15000 --offline_exploitation --cql_alpha 0 --unsupervised_exploration --exploit_rew_shift 1 --exploit_rew_scale 25 --exp_name q2_dql_numsteps_15000
python cs285/scripts/read_results.py q2_dql_numsteps_5000 q2_dql_numsteps_15000 --figname image/q2_3.png

:: SubPart 3
python cs285/scripts/run_hw5_expl.py --env_name PointmassMedium-v0 --use_rnd --unsupervised_exploration --offline_exploitation --cql_alpha 0.02 --exploit_rew_shift 1 --exploit_rew_scale 10 --exp_name q2_alpha_0.02
python cs285/scripts/run_hw5_expl.py --env_name PointmassMedium-v0 --use_rnd --unsupervised_exploration --offline_exploitation --cql_alpha 0.5 --exploit_rew_shift 1 --exploit_rew_scale 10 --exp_name q2_alpha_0.5
python cs285/scripts/read_results.py q2_alpha_0.02 q2_alpha_0.5 --figname image/q2_4.png

:: Part 3
python cs285/scripts/run_hw5_expl.py --env_name PointmassMedium-v0 --use_rnd --num_exploration_steps=20000 --cql_alpha=0.0 --exploit_rew_shift 1 --exploit_rew_scale 10 --exp_name q3_medium_dqn
python cs285/scripts/run_hw5_expl.py --env_name PointmassMedium-v0 --use_rnd --num_exploration_steps=20000 --cql_alpha=1.0 --exploit_rew_shift 1 --exploit_rew_scale 10 --exp_name q3_medium_cql
python cs285/scripts/read_results.py q3_medium_dqn q3_medium_cql --figname image/q3_1.png

python cs285/scripts/run_hw5_expl.py --env_name PointmassHard-v0 --use_rnd --num_exploration_steps=20000 --cql_alpha=0.0 --exploit_rew_shift 1 --exploit_rew_scale 25 --exp_name q3_hard_dqn
python cs285/scripts/run_hw5_expl.py --env_name PointmassHard-v0 --use_rnd --num_exploration_steps=20000 --cql_alpha=1.0 --exploit_rew_shift 1 --exploit_rew_scale 25 --exp_name q3_hard_cql
python cs285/scripts/read_results.py q3_hard_dqn q3_hard_cql --figname image/q3_2.png
