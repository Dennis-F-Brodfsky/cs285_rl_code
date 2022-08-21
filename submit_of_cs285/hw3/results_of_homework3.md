## Problem 1
![dqn Macman-v0](image/exp1_1.png)
when the algo implement 1e8 steps, we get score nearly 3000 which is higher than requirement of 1500 score.

## Problem 2
![](image/exp2_1.png)
![](image/exp2_2.png)
by using double dqn, the final performance is slightly higher than initial dqn.

## Problem 4
![](image/exp4_1.png)
the group with num_target_updates=10, num_grad_steps_per_target_update=10 behaves the best, which reaches the expected score 200. 

## Problem 5
the following figures show the performance of actor-critic algorighm in more diffcult games.And Both of them reaches the requirements in [homework pdf](CS285_hw3.pdf)
![Actor-critic with env: InvertedPendulum-v2](image/exp5_1.png)

![Actor-critic with env: HalfCheetah-v2](image/exp5_2.png)
