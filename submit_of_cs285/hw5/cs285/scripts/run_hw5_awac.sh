cd hw5
# Part 4
for lam in 0.1 1 2 10 20 50; do
    python cs285/scripts/run_hw5_awac.py --env_name PointmassMedium-v0 --exp_name q5_awac_medium_unsupervised_lam$lam --use_rnd --unsupervised_exploration --awac_lambda $lam --num_exploration_steps 20000
done
python cs285/scripts/read_results.py q5_awac_medium_unsupervised_lam0.1 q5_awac_medium_unsupervised_lam1 q5_awac_medium_unsupervised_lam2 q5_awac_medium_unsupervised_lam10 q5_awac_medium_unsupervised_lam20 q5_awac_medium_unsupervised_lam50 --figname image/q4_1.png

for lam in 0.1,1,2,10,20,50; do
    python cs285/scripts/run_hw5_awac.py --env_name PointmassMedium-v0 --use_rnd --num_exploration_steps 20000 --awac_lambda $lam --exp_name q5_awac_medium_supervised_lam$lam
done
python cs285/scripts/read_results.py q5_awac_medium_supervised_lam0.1 q5_awac_medium_supervised_lam1 q5_awac_medium_supervised_lam2 q5_awac_medium_supervised_lam10 q5_awac_medium_supervised_lam20 q5_awac_medium_supervised_lam50 --figname image/q4_2.png

for lam in 0.1,1,2,10,20,50; do
    python cs285/scripts/run_hw5_awac.py --env_name PointmassEasy-v0 --exp_name q5_awac_easy_unsupervised_lam$lam --use_rnd --unsupervised_exploration --awac_lambda $lam --num_exploration_steps 20000
done
python cs285/scripts/read_results.py q5_awac_easy_unsupervised_lam0.1 q5_awac_easy_unsupervised_lam1 q5_awac_easy_unsupervised_lam2 q5_awac_easy_unsupervised_lam10 q5_awac_easy_unsupervised_lam20 q5_awac_easy_unsupervised_lam50 --figname image/q4_3.png

for lam in 0.1,1,2,10,20,50; do
    python cs285/scripts/run_hw5_awac.py --env_name PointmassEasy-v0 --use_rnd --num_exploration_steps 20000 --awac_lambda $lam --exp_name q5_awac_easy_supervised_lam$lam
done
python cs285/scripts/read_results.py q5_awac_easy_supervised_lam0.1 q5_awac_easy_supervised_lam1 q5_awac_easy_supervised_lam2 q5_awac_easy_supervised_lam10 q5_awac_easy_supervised_lam20 q5_awac_easy_supervised_lam50 --figname image/q4_4.png
