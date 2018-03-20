function [ result ] = ask_oracle(var1, var2, var3)
%ASK_ORACLE gives the true value of the mutual information 
% between var1 and var2, conditionnaly to var3, where 'true' 
% can be understood as 'on an infinite number of samples'. 
% Var3 can be an empty set. 
%
%	Examples :
%	ask_oracle(1,5,3);
%	ask_oracle(3,8,[]);

load data_oracle;

if (isempty(var3));
	result = mi(var1,var2);
else
	result = mic(var1,var2,var3);
end

