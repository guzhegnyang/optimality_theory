%hw2.m
[a_opt, sampling_opt] = optimization_method(@f, 0, 1, 1, 10);
[a_frac23, sampling_frac23] = frac23_method(@f, 0, 1, 1, 10);

figure;
plot(a_opt);
hold on;
plot(a_frac23);
hold off;
legend('0.618法','0.666法');
xlabel('k');
ylabel('error');
title('error-k图');

figure;
plot(sampling_opt, a_opt);
hold on;
plot(sampling_frac23, a_frac23);
hold off;
legend('0.618法','0.666法');
xlabel('sampling');
ylabel('error');
title('error-sampling图');