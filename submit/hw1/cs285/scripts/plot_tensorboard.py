from tensorboard.backend.event_processing import event_accumulator
import matplotlib.pyplot as plt
import numpy as np
import argparse


# mainly for plot error-bar plot for dagger-task.

def draw_error_bar(tensorboard_paths, names):
    fig, ax = plt.subplots(len(tensorboard_paths), 1, sharex=True)
    ax = np.ravel(ax)
    for i, (tensorboard_path, name) in enumerate(zip(tensorboard_paths, names)):
        ea = event_accumulator.EventAccumulator(tensorboard_path)
        ea.Reload()
        mean_val = ea.scalars.Items('Eval_AverageReturn')
        std_val = ea.scalars.Items('Eval_StdReturn')
        assert len(mean_val) == len(std_val), 'should be the same steps'
        ax[i].errorbar(list(range(len(mean_val))), 
                    [val.value for val in mean_val], 
                    [val.value for val in std_val])
        ax[i].set_title(name)
        ax[i].set_ylabel('Eval_AverageReturn')
    ax[-1].set_xlabel('Steps')
    fig.savefig('image/Task_Do_Dagger.png')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--log_path", type=str, nargs='*', required=True)
    parser.add_argument("--names", type=str, nargs='*', required=True)
    arg = parser.parse_args()
    draw_error_bar(arg.log_path, arg.names)
