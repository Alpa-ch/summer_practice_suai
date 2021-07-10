alpha1 = 0.5;
alpha2 = 0.1;
beta1 = 0.5;
beta2 = 0.1;
T = 2;
rho = -5;
d = -5;

h = 0.1;
t_s = 0;
t_m = 100;
n = floor(t_m / h);
t = 1:n;

x1 = zeros(1, n);
x2 = zeros(1, n);
x1(1) = 1;
x2(1) = 1;

u = @(x1_, x2_) (beta1 * x2_ * x1_ - x1_ - rho * x2_ + rho * h * ...
    (-alpha2 * x2_ + beta2 * x1_ * x2_) - d - (x1_ - rho * x2_ + d)/T) / (x1_) * h;
u_ = zeros(n + 1);

for i = 1:n-1
    x1(i + 1)= x1(i) + h *(u(x1(i), x2(i)) * x1(i) - beta1 * x1(i) * x2(i));
    x2(i + 1)= x2(i) + h *(-alpha2 * x2(i) + beta2 * x1(i) * x2(i));
    t(i + 1) = t(i) + h;
end


figure(1)
plot(t, x1, 'r', t, x2, 'b');
legend('Жертва', 'Хищник');
xlabel('Время');
ylabel('Популяция');
