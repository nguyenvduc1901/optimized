clear all
close all
mkdir(date);
%Dau vao  
[NT, nameDs] = generate_data();
[T,S] = proTraS(NT);

%==================================Visualize================================
f1 = figure;
plot(T(:,1), T(:,2),'*','color','yellow');
hold on 
plot(S(:,1), S(:,2),'x','color','blue');
axis equal
fname = sprintf('%s\\ProTraS_%s_1_%s.png',datestr(date),nameDs,datestr(now,'HH-MM-SS'));
title('ProTraS');
print(f1,fname,'-dpng');

[RiVAT, b, c] = iVAT(distance2(S,S));
f2 = figure;
imagesc(RiVAT); colormap(gray); axis image; axis off;
fname = sprintf('%s\\coreVAT_%s_2_%s.png',datestr(date),nameDs,datestr(now,'HH-MM-SS'));
title('coreVAT');
print(f2,fname,'-dpng');


%
cprintf('Magenta','\nProTraS Done ===> siVAT processing.....\n');
ns = size(S,1);
cp = [40 70 100 4 200 4 30 30 30 30 18 18 18 18 18];
indCp = str2num(nameDs(end));
if size(nameDs,2) == 3
    indCp = str2num(nameDs(end-1:end));
end
cprintf('key', '\nNumber of sample points equals no sample in ProTraS, ns = %d',ns); 
cprintf('key', '\nNumber of overestimate cluster is 2x(ground truth cluster), cp = %d',cp(indCp)); 
cprintf('text', '\nTo modify these, go to line 94 on ProTraS.m');

[riVAT, smp] = siVAT(T, cp(indCp), ns);
f3 = figure;
plot(T(:,1), T(:,2),'*','color','yellow');
hold on 
plot(smp(:,1), smp(:,2),'x','color','blue');
axis equal
fname = sprintf('%s\\siVAT_%s_1_%s.png',datestr(date),nameDs,datestr(now,'HH-MM-SS'));
title('siVAT');
print(f3,fname,'-dpng');

f4 = figure;
imagesc(riVAT); colormap(gray); axis image; axis off;
fname = sprintf('%s\\siVAT_%s_2_%s.png',datestr(date),nameDs,datestr(now,'HH-MM-SS'));
title('siVAT');
print(f4,fname,'-dpng');

cprintf('Magenta', '\n\nDone, check result on folder %s! \n', datestr(date));