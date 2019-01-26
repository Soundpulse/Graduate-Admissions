function plotGRE(input)

%GRE score vs University Ranking (Bars Representation)
c = ['r','k','y','g','b'];
for i = 1:5
GRE = input(input(:,3) == i,1);
h = histfit(GRE);
axis([0.8 1 0 20]);
delete(h(2));
set(h(1),'facecolor',c(i));
hold on;
end
legend('MIT','Stanford','Harvard','Caltech','Oxford');
xlabel('Mark Percentage (GRE)');
ylabel('Count');

fprintf('Program paused. Press enter to continue.\n');
pause;
hold off;

%GRE score vs University Ranking (Lines Representation)
c = ['r','k','y','g','b'];
for i = 1:5
GRE = input(input(:,3) == i,1);
h = histfit(GRE);
axis([0.8 1 0 20]);
set(h(2),'color',c(i));
delete(h(1));
hold on;
end
legend('MIT','Stanford','Harvard','Caltech','Oxford');
xlabel('Mark Percentage (GRE)');
ylabel('Count');

hold off;

end