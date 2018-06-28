%Challenge Problem

result1 = Homework6(100);
result2 = Homework6(1000);
result3 = Homework6(10000);

figure;
histogram(result1(1,:),20)
title('Probability Distribution of mean x for 100 simulations')
xlabel('x displacement')
ylabel('Frequency')
figure;
histogram(result2(1,:),20)
title('Probability Distribution of mean x for 1000 simulations')
xlabel('x displacement')
ylabel('Frequency')
figure;
histogram(result3(1,:),20)
title('Probability Distribution of mean x for 10000 simulations')
xlabel('x displacement')
ylabel('Frequency')

figure;
histogram(result1(2,:),20)
title('Probability Distribution of mean y for 100 simulations')
xlabel('y displacement')
ylabel('Frequency')
figure;
histogram(result2(2,:),20)
title('Probability Distribution of mean y for 1000 simulations')
xlabel('y displacement')
ylabel('Frequency')
figure;
histogram(result3(2,:),20)
title('Probability Distribution of mean y for 10000 simulations')
xlabel('y displacement')
ylabel('Frequency')