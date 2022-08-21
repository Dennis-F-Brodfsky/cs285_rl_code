import glob
import matplotlib.pyplot as plt
import numpy as np
from tensorboard.backend.event_processing import event_accumulator


def get_section_results(file, *X_name):
    X = []
    ea = event_accumulator.EventAccumulator(file)
    ea.Reload()
    X = [[val.value for val in ea.scalars.Items(x_name)] for x_name in X_name]
    return X

def set_axes(axes, xlabel, ylabel, xlim, ylim, xscale, yscale, legend):
    axes.set_xlabel(xlabel)
    axes.set_ylabel(ylabel)
    axes.set_xscale(xscale)
    axes.set_yscale(yscale)
    axes.set_xlim(xlim)
    axes.set_ylim(ylim)
    if legend:
        axes.legend(legend)
    axes.grid()

def plot(figname, figsize, X, Y=None, xlabel=None, ylabel=None, legend=None, xlim=None, ylim=None, xscale='linear', yscale='linear', fmts=('-', 'm--', 'g-.', 'r:'), axes=None):
    if legend is None:
        legend = []
    plt.rcParams['figure.figsize']=figsize
    plt.rcParams['font.sans-serif']=['SimHei']
    plt.rcParams['axes.unicode_minus']=False
    axes = axes if axes else plt.gca()
    fig = axes.get_figure()
    def has_one_axis(X):
        return (hasattr(X, "ndim") and X.ndim == 1 or isinstance(X, list) and not hasattr(X[0], "__len__"))
    if has_one_axis(X):
        X = [X]
    if Y is None:
        X, Y = [[]] * len(X), X
    elif has_one_axis(Y):
        Y = [Y]
    if len(X) != len(Y):
        X = X * len(Y)
    axes.cla()
    for x, y, fmt in zip(X, Y, fmts):
        if len(x):
            axes.plot(x, y, fmt)
        else:
            axes.plot(y, fmt)
    set_axes(axes, xlabel, ylabel, xlim, ylim, xscale, yscale, legend)
    fig.savefig(figname)
    plt.close(fig)

def plot_error_bar(log_files, exp_names, **kwargs):
    fig, ax = plt.subplots(len(log_files), 1, sharex=True)
    ax = np.ravel(ax)
    for i, (log_file, experiment) in enumerate(zip(log_files, exp_names)):
        tmp_ear, tmp_x, tmp_y, tmp_err = get_section_results(log_file, 'Train_AverageReturn', 'Train_EnvstepsSoFar', 'Eval_AverageReturn', 'Eval_StdReturn')
        ax[i].errorbar(tmp_x, tmp_y, tmp_err)
        ax[i].set_title(experiment)
        ax[i].set_ylabel('Eval_AverageReturn')
        ax[i].axhline(tmp_ear, color='r', linestyle='--')
    ax[-1].set_xlabel('Steps')
    fig.savefig(kwargs['figname'])
    plt.close(fig)

def plot_learning_curve(log_files, **kwargs):
    x, y = [], []
    for log_file in log_files:
        tmp_x, tmp_y = get_section_results(log_file, kwargs['xlabel'], kwargs['ylabel'])
        if len(tmp_x) == len(tmp_y):
            x.append(tmp_x)
        else:
            assert len(tmp_x) == len(tmp_y)+1
            x.append(tmp_x[1:])
        y.append(tmp_y)
    plot(kwargs['figname'], kwargs['figsize'], x, y, kwargs['xlabel'], kwargs['ylabel'], kwargs['exp_names'], kwargs['xlim'], kwargs['ylim'], fmts=kwargs['format'])
    
def plot_avg_performance(log_files, **kwargs):
    x, y = [], []
    for log_file in log_files:
        tmp_x, tmp_y = get_section_results(log_file, kwargs['xlabel'], kwargs['ylabel'])
        if len(tmp_x) == len(tmp_y):
            x.append(tmp_x)
        else:
            assert len(tmp_x) == len(tmp_y)+1
            x.append(tmp_x[1:])
        y.append(tmp_y)
    plot(kwargs['figname'], kwargs['figsize'], np.mean(x, axis=0), np.mean(y, axis=0), kwargs['xlabel'], kwargs['ylabel'], kwargs['exp_names'], kwargs['xlim'], kwargs['ylim'], fmts=kwargs['format'])

def main():
    import argparse
    import itertools
    import random
    
    FMT_LST = [''.join(pair) for pair in itertools.product(['b', 'g', 'r', 'c', 'm', 'y', 'k'], ['-', '--', '-.'])]
    PLOT_TYPE = {'error_bar': plot_error_bar, 'learning_curve': plot_learning_curve, 'avg_performance': plot_avg_performance} 
    parser = argparse.ArgumentParser()
    parser.add_argument('exp_names', nargs='+', type=str)
    parser.add_argument('--plot_type', choices=['error_bar', 'learning_curve', 'avg_performance'], default='learning_curve')
    parser.add_argument('-f', '--format', nargs='*', type=str)
    parser.add_argument('-x', '--xlabel', type=str, default='Train_EnvstepsSoFar')
    parser.add_argument('-y', '--ylabel', type=str, default='Eval_AverageReturn')
    parser.add_argument('--xlim', nargs=2, type=float, default=None)
    parser.add_argument('--ylim', nargs=2, type=float, default=None)
    parser.add_argument('--figsize', nargs=2, type=int, default=[10, 8])
    parser.add_argument('--figname', type=str, default='q1')
    arg = parser.parse_args()
    if not arg.format:
        arg.format = random.sample(FMT_LST, len(arg.exp_names))
    log_files = [glob.glob('data/*'+experiment+'*/events*')[0] for experiment in arg.exp_names]
    PLOT_TYPE[arg.plot_type](log_files, **vars(arg))
    

if __name__ == '__main__':
    main()
