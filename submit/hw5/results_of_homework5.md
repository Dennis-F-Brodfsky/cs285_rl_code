## q1
![rnd in easy env](image/q1_1.png)
![rnd in medium env](image/q1_2.png)
No matter in easy env or medium env, rnd group do better in exploration.

## q2
![Model: cql and dql Env: medium pointmass](image/q2_1.png)
as the image shown, by using cql and make use of trick of reward scale and reward shift, the behaviors of the agents act better thans the dql algorighm.
![Model: cql Hyper: numsteps Env: hard](image/q2_2.png)
![Model: dql Hyper: numsteps Env: hard](image/q2_3.png)
the more numsteps of exploration, the bettter the behaivor.
![Model: cql Hyper: cql_alpha](image/q2_4.png)
cql_alpha = 0.5 behaves little worse than cql_alpha=0.02

## q3
![Model: cql dql Env medium](image/q3_1.png)
![Model: cql dql Env hard](image/q3_2.png)
the two pictures indicate that in hard pointmass, the exploration plays an important role in the performance of models.

## q4
![medium Env with unsupervised_exploration](image/q4_1.png)
![medium Env with supervised_exploration](image/q4_2.png)
![easy Env with unsupervised_exploration](image/q4_3.png)
![easy Env with supervised_exploration](image/q4_4.png)
the results above shows the performance of AWAC agents with different hyperparameter **awac_lambda** and **is_superviesed_exploration** in medium and easy pointmass environment.