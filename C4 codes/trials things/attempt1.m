clc;clear;close all;
P=[0.35 0.01 0 0.64;0.37 0.11 0.01 0.51;0.19 0.15 0.1 0.56;0 0.05 0.02 0.93];

v = null(transpose(P-eye(length(P))));
pi = v.*(ones(length(P),1)*(1./sum(v)));

mc = dtmc(P);
stateNames = ["1" "2" "3" "4"];
mc.StateNames = stateNames;
figure;

graphplot(mc,'ColorEdges',true);