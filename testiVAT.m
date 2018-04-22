clear all

for i=1:4
    filename = ['Datasets/s' num2str(i) '.txt'];
    data_matrix_with_label = importdata(filename);
    data_matrix = data_matrix_with_label(:,1:end);
    nameDs = filename(end-5:end-4);
    if nameDs(1) == '1'
        nameDs = filename(end-6:end-4);
    end
    [n, ~] = size(data_matrix);
    T = normalize(data_matrix);
    [RiVAT,~,~] = iVAT(distance2(T,T));
    f2 = figure;
    imagesc(RiVAT); colormap(gray); axis image; axis off;
    fname = sprintf('%s\\iVAT_%s_3_%s.png',datestr(date),nameDs,datestr(now,'HH-MM-SS'));
    title('iVAT');
    print(f2,fname,'-dpng');
    
    cprintf('Blue', 'Done');
end
