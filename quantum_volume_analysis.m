clear all
close all
clc

%% Quantum Volume analysis

% Algorithm Quantum Volume

N_max = 1e3;
d_max = 1e6;

[N,d] = meshgrid(2:1e1:N_max,1:1e3:d_max);

% for i = 1:10:N
%     for j = 1:10:d
%         V_Q_a(i,j) = (min(i,j)).^2;
%     end
%     
% end
        
V_Q_a = (min(N,d)).^2;

figure
s = surf(N,d,V_Q_a);
set(gca,'XScale','log')
set(gca,'YScale','log')
s.EdgeColor = 'none';
colorbar
title('Algorithm Quantum Volume Analysis')
xlabel('Number of qubits')
ylabel('Depth')
zlabel('Quantum Volume')

% Device Quantum Volume

N_max = 1e4;
epsilon_eff_min = 1e-6;

[N,epsilon_eff] = meshgrid(2:1:N_max,epsilon_eff_min:1e-3:1);

d2 = 1./(N.*epsilon_eff);

V_Q = (min(N,d2)).^2;

figure
s = surf(N(1,:),epsilon_eff(:,1),V_Q);
set(gca,'XScale','log')
set(gca,'YScale','log')
s.EdgeColor = 'none';
colorbar
title('Device Quantum Volume Analysis')
xlabel('Number of qubits')
ylabel('\epsilon_{eff}')
zlabel('Quantum Volume')

[M_n, n_max] = max(V_Q,[],2);
[M_e, epsilon_max] = max(V_Q);
epsilon_max = epsilon_eff_min .* epsilon_max;

figure
plot(N(1,:),max(V_Q))
title('Quantum Volume Analysis with maximum n')
xlabel('Number of qubits')
ylabel('Max Quantum Volume')

%% Maximization Quantum Volume analysis

N_max = 1e3;
epsilon_eff_min = 1e-5;


for N_i = 2:N_max

    [n,epsilon_eff] = meshgrid(2:1:N_i,epsilon_eff_min:1e-3:1);

    d2 = 1./(n.*epsilon_eff);

    V_Q = (min(n,d2)).^2;
    
    V_Q_max(:,N_i) = max(V_Q,[],2);
    
%     if d2 == N_i
%         
%         line (N_i) = max(max(V_Q));
%         
%     end

end


figure
s = surf(1:N_max,epsilon_eff(:,1),V_Q_max);
set(gca,'XScale','log')
set(gca,'YScale','log')
s.EdgeColor = 'none';
colorbar
title('General Quantum Volume Analysis')
xlabel('Number of qubits')
ylabel('\epsilon_{eff}')
zlabel('Quantum Volume')

